/*
 * RTOS application: test an RTOS
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

// processor related macros
#include "proc.h"

/// RTOS environment
struct rtos rtos_env;

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

void rtos_init(void)
{
    int i;

    // initialize the event pending
    rtos_env.eventmask = 0;
    // save the thread contexts array
    rtos_env.threads = thread_contexts;

    // initialize the threads
    for (i = 0; i < ARRAY_SIZE(threads); i++)
    {
        // create the tasks as active to initialize them
        rtos_env.threads[i].sigmask = 0;
        rtos_create(&rtos_env.threads[i].sp, threads[i].fn, threads[i].stack);
    }
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
    // wait for any of the events in the event mask
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

    // set new interrupts
    rtos_env.eventmask |= eventmask;

    PROC_INT_RESTORE();
}

void rtos_eventclear(uint32_t eventmask)
{
    // protect the events related operations from interrupts
    PROC_INT_DISABLE();

    // clear interrupts
    rtos_env.eventmask &= ~eventmask;

    PROC_INT_RESTORE();
}
