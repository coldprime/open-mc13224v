/*
 * RTOS kernel implementation
 *
 *    Copyright (C) 2009 Louis Caron
 *
 *    This program is free software: you can redistribute it and/or modify
 *    it under the terms of the GNU General Public License as published by
 *    the Free Software Foundation, either version 3 of the License, or
 *    (at your option) any later version.
 *
 *    This program is distributed in the hope that it will be useful,
 *    but WITHOUT ANY WARRANTY; without even the implied warranty of
 *    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *    GNU General Public License for more details.
 *
 *    You should have received a copy of the GNU General Public License
 *    along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

// minimum include
#include "rtos.h"

// compiler related macros
#include "compiler.h"

// processor related macros
#include "proc/proc.h"

/// RTOS environment
struct rtos rtos_env;

/// Free memory block delimiter structure (size must be word multiple)
struct rtos_mem_free
{
    struct rtos_mem_free *next;     ///< Pointer to the next block
    size_t size;                    ///< Size of the current block (including delimiter)
};

/// Used memory block delimiter structure (size must be word multiple)
struct rtos_mem_used
{
    size_t size;                    ///< Size of the current block (including delimiter)
};



// define event handlers
static void schedule_threads(void);
extern void event_pb0(void);
extern void event_pb1(void);
extern void event_pb2(void);
extern void event_pb3(void);

/// Main descriptor of the event handlers
static void (* const events[])(void) =
{
    [RTOS_E_THREADS_INDEX] = schedule_threads,
    [RTOS_E_PB0_INDEX]     = event_pb0,
    [RTOS_E_PB1_INDEX]     = event_pb1,
    [RTOS_E_PB2_INDEX]     = event_pb2,
    [RTOS_E_PB3_INDEX]     = event_pb3
};

/// Definition of the stack for the various threads
static uint32_t thread0_stack[32];
static uint32_t thread1_stack[16];

extern void Thread0(void);
extern void Thread1(void);

#define ARRAY_SIZE(x) (sizeof(x)/sizeof(x[0]))
#define STACK_BASE(x) (&(((uint32_t *)(x))[ARRAY_SIZE(x)]))
/// Thread descriptors array
static const struct thread_d threads[] =
{
    [RTOS_T_THREAD0] = {Thread0, STACK_BASE(thread0_stack)},
    [RTOS_T_THREAD1] = {Thread1, STACK_BASE(thread1_stack)}
};

static struct thread_c thread_contexts[ARRAY_SIZE(threads)];

/// Schedule the threads in the RTOS
static void schedule_threads(void)
{
    int i;

    // start by clearing the pending event
    rtos_eventclear(RTOS_EVENT(THREADS));

    for (i = 0; i < ARRAY_SIZE(threads); i++)
    {
        if (rtos_env.threads[i].sigmask == 0)
        {
            // save the current thread index
            rtos_env.thread_cur = i;

            // switch between the current task and the new one to schedule
            rtos_switch(&rtos_env.threads[i].sp, &rtos_env.sp);
        }
    }
}

void rtos_init(void* heap_bottom, void* heap_top)
{
    int i;

    // initialize the event pending
    rtos_env.eventmask = 0;
    // save the thread contexts array
    rtos_env.threads = thread_contexts;

    // initialize the threads
    for (i = 0; i < ARRAY_SIZE(threads); i++)
    {
        // create the threads as inactive
        rtos_env.threads[i].pending = NULL;
        rtos_env.threads[i].saved = NULL;
        rtos_env.threads[i].sp = 0;

        // by default there is no pending mask
        rtos_env.threads[i].sigmask = 0;
        rtos_create(&rtos_env.threads[i].sp, threads[i].fn, threads[i].stack);
    }

    // align address of heap bottom on word boundary
    rtos_env.mfree = (struct rtos_mem_free*)heap_bottom;

    // initialize the first block
    rtos_env.mfree->size = (size_t)heap_top - (size_t)rtos_env.mfree;
    rtos_env.mfree->next = NULL;
}

void rtos_scheduler(uint32_t const *stack)
{
    // reset the stack
    PROC_SP_RESET(stack);

    do
    {
        while (rtos_env.eventmask)
        {
            uint32_t event;

            // return the next event to handle
            PROC_CLZ(event, rtos_env.eventmask);

            // call the appropriate event handler
            events[event]();
        }

        // otherwise go to sleep, waiting for an interrupt

    } while (1);
}

void rtos_sigwait(uint32_t sigmask)
{
    // wait for any of the signals in the signal mask
    rtos_env.threads[rtos_env.thread_cur].sigmask = sigmask;

    // switch back to the scheduler
    rtos_switch(&rtos_env.sp, &rtos_env.threads[rtos_env.thread_cur].sp);
}

void rtos_sigraise(uint32_t sigmask)
{
    int cnt;
    for (cnt = 0; cnt < ARRAY_SIZE(threads); cnt++)
    {
        if (rtos_env.threads[cnt].sigmask & sigmask)
        {
            // unlock the thread
            rtos_env.threads[cnt].sigmask = 0;

            // force a thread schedule event
            rtos_eventraise(RTOS_EVENT(THREADS));
        }
    }
}

void rtos_eventraise(uint32_t eventmask)
{
    // protect the events related operations from interrupts
    PROC_INT_DISABLE();

    // set new events
    rtos_env.eventmask |= eventmask;

    // restore interrupts
    PROC_INT_RESTORE();
}

void rtos_eventclear(uint32_t eventmask)
{
    // protect the events related operations from interrupts
    PROC_INT_DISABLE();

    // clear events
    rtos_env.eventmask &= ~eventmask;

    // restore interrupts
    PROC_INT_RESTORE();
}

void *rtos_malloc(size_t size)
{
    struct rtos_mem_free *node, *found;
    struct rtos_mem_used *alloc;
    size_t totalsize;

    // initialize the pointers
    found = NULL;

    // compute total block size: requested size PLUS used descriptor size
    totalsize = ((size + 3) & (~3)) + sizeof(struct rtos_mem_used);

    // sanity check: the totalsize should be large enough to hold free block descriptor
    ASSERT(totalsize >= sizeof(struct rtos_mem_free));

    // point to the first free block in the memory
    node = rtos_env.mfree;

    // go through free memory blocks list
    while (node != NULL)
    {
        // check if there is enough room in this free block
        if (node->size >= (totalsize + sizeof(struct rtos_mem_free)))
        {
            // if a match was already found, check if this one is smaller
            if ((found == NULL) || (found->size > node->size))
            {
                found = node;
            }
        }
        // move to next block
        node = node->next;
    }

    // found a free block that matches, subtract the allocation size from the
    // free block size. If equal, the free block will be kept with 0 size... but
    // moving it out of the linked list is too much check for little improvement.
    found->size -= totalsize;

    // compute the pointer to the beginning of the free space
    alloc = (struct rtos_mem_used*) ((uint32_t)found + found->size);

    // sanity check: allocation should always succeed
    ASSERT(found != NULL);

    // save the size of the allocated block (use low bit to indicate mem type)
    alloc->size = totalsize;

    // move to the user memory space
    alloc++;

    return (void*)alloc;
}

void rtos_free(void *pointer)
{
    struct rtos_mem_used *freed;
    struct rtos_mem_free *node, *prev_node, *next_node;
    uint32_t size;

    // point to the block descriptor (before user memory so decrement)
    freed = ((struct rtos_mem_used *)pointer) - 1;

    // point to the first node of the free elements linked list
    size = freed->size;
    node = rtos_env.mfree;
    prev_node = NULL;

    // sanity checks
    ASSERT(pointer != NULL);
    ASSERT((uint32_t)pointer > (uint32_t)node);

    while (node != NULL)
    {
        // check if the freed block is right after the current block
        if ((uint32_t)freed == ((uint32_t)node + node->size))
        {
            // append the freed block to the current one
            node->size += size;

            // check if this merge made the link between free blocks
            if ((uint32_t)node->next == ((uint32_t)node + node->size))
            {
                next_node = node->next;
                // add the size of the next node to the current node
                node->size += next_node->size;
                // update the next of the current node
                node->next = next_node->next;
            }
            goto free_end;
        }
        else if ((uint32_t)freed < (uint32_t)node)
        {
            // sanity check: can not happen before first node
            ASSERT(prev_node != NULL);

            // update the next pointer of the previous node
            prev_node->next = (struct rtos_mem_free*)freed;

            // check if the released node is right before the free block
            if (((uint32_t)freed + size) == (uint32_t)node)
            {
                // merge the two nodes
                ((struct rtos_mem_free*)freed)->next = node->next;
                ((struct rtos_mem_free*)freed)->size = node->size + (uint32_t)node - (uint32_t)freed;
            }
            else
            {
                // insert the new node
                ((struct rtos_mem_free*)freed)->next = node;
                ((struct rtos_mem_free*)freed)->size = size;
            }
            goto free_end;
        }

        // move to the next free block node
        prev_node = node;
        node = node->next;
    }
    // if reached here, freed block is after last free block and not contiguous
    prev_node->next = (struct rtos_mem_free*)freed;
    ((struct rtos_mem_free*)freed)->next = NULL;
    ((struct rtos_mem_free*)freed)->size = size;

free_end:
    return;
}



