/*
 * RTOS related header file
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

#ifndef _RTOS_H_
#define _RTOS_H_

// standard includes
#include <stddef.h>
#include <stdint.h>

// forward declarations
struct rtos_mem_free;

/// Definition of the events in the system, highest priority first
enum
{
    RTOS_E_TIMER_INDEX = 0,
    RTOS_E_PB0_INDEX,
    RTOS_E_THREADS_INDEX,
    RTOS_E_PB1_INDEX,
    RTOS_E_PB2_INDEX,
    RTOS_E_PB3_INDEX
};

/** Definition of the event bits for the raise operations the inversion (31-x) is used
 * to improve the scheduler timing with clz operation which returns the leftmost 0 count
 */
#define RTOS_EVENT(__e) (1<<(31-(RTOS_E_ ## __e ## _INDEX)))

/// Definition of the threads in the system
enum
{
    RTOS_T_THREAD0 = 0,
    RTOS_T_THREAD1
};

/// Definition of the signals in the system
enum
{
    RTOS_S_TIMEOUT = (1 << 30),
    RTOS_S_MSG = (1 << 31),
};

/// Thread descriptor for the RTOS initialization
struct thread_d
{
    /// Thread function
    void (*fn)(void);

    /// Thread stack base (first word above the allocated stack space)
    uint32_t *stack;
};

/// Thread context from the RTOS point of view
struct thread_c
{
    /// Head of the list of pending messages for the thread
    struct rtos_msg* pending;

    /// Head of the saved messages for the thread
    struct rtos_msg* saved;

    /// Mask of the signals on which the thread is currently waiting:
    ///   + bit 31: pending messages to the thread
    uint32_t sigmask;

    /// Thread stack pointer location for storage when thread is pending on signals
    uint32_t sp;

    struct
    {
        /// Pointer to the next element in the timed threads list
        struct thread_c *next;
        /// Absolute expiration date of the timeout
        uint32_t date;
    } timeout;
};

/// RTOS main environment
struct rtos
{
    /// Thread contexts array
    struct thread_c *threads;

    /// Current thread
    uint8_t thread_cur;

    /// Background stack pointer location for storage when no more threads active
    uint32_t sp;

    /// Mask of the events that are set (volatile because it can be updated under int)
    volatile uint32_t eventmask;

    /// Pointer to the first free block to use for allocate/free routines
    struct rtos_mem_free *mfree;

    /// List of the threads that have a timeout running
    struct thread_c *timed;
};

/// RTOS environment
extern struct rtos rtos_env;

/**
 * Switch between threads
 * @param[in] sp_new Pointer to the SP storage location of the thread to switch to
 * @param[out] sp_old Pointer to the SP storage location of the current thread
 */
extern void rtos_switch(uint32_t const *sp_new, uint32_t *sp_old);

/**
 * Create a thread context
 * @param[out] sp_save Pointer to the SP storage location of the thread to create
 * @param[in] fn Thread start function
 * @param[in] stack Pointer to the first word above the stack allocated for this thread
 */
extern void rtos_create(uint32_t *sp_save, void(*fn)(void), uint32_t const *stack);

/**
 * Initialize the RTOS
 *
 * @param[in] heap_bottom Pointer to first word in the heap (must be word aligned)
 * @param[in] heap_top Pointer to last word lower or equal to end of heap
 */
extern void rtos_init(void* heap_bottom, void* heap_top);

/**
 * Launch the RTOS scheduler, this function never returns
 * @param[in] stack Pointer to the first word above the stack (full descending stack)
 */
extern void rtos_scheduler(uint32_t const *stack);

/**
 * Wait for any signal in a signal mask
 * @param[in] sigmask Mask of the signals to wait for
 */
extern void rtos_sigwait(uint32_t sigmask);

/**
 * Raise signals, this will release all threads pending on any of these signals
 * @param[in] sigmask Mask of the signals to raise
 */
extern void rtos_sigraise(uint32_t sigmask);

/**
 * Raise events, this will trigger appropriate event handlers in the next schedule loop
 * @param[in] eventmask Mask of the events to raise
 */
extern void rtos_eventraise(uint32_t eventmask);

/**
 * Clear events, this will clear an event mask
 * @param[in] eventmask Mask of the events to clear
 */
extern void rtos_eventclear(uint32_t eventmask);

/**
 * Memory allocator
 * @param[in] size Amount of memory requested
 * @return Pointer to the allocated memory, NULL if allocation failed
 */
extern void *rtos_malloc(size_t size);

/**
 * Free an allocated block
 * @param[in] pointer Pointer to the allocated block to free
 */
extern void rtos_free(void *pointer);

/**
 * Post an RTOS message
 *
 * This function is called before the message is actually filled by the user and this is
 * not a bug.  Since the current thread will only lose focus when it will wait for a
 * message, it has exclusive ownership of the message content until then.
 * @param[in] dest Destination thread identifier
 * @param[in] id RTOS message identifier
 * @param[in] size Size of the required user space in the message
 * @return Pointer to the message user content, can not fail otherwise asserts
 */
extern void *rtos_msg_post(uint8_t dest, uint16_t id, size_t size);

/**
 * Retrieve the next RTOS message for the current thread
 * @param[out] src Source thread identifier
 * @param[out] id RTOS message identifier
 * @return Pointer to the message user content
 */
extern void *rtos_msg_get(uint8_t *src, uint16_t *id);

/**
 * Wait for a specific RTOS message
 *
 * This function stores all the received RTOS messages in the save list until the
 * specified message is received
 * @param[in] id Identifier of the RTOS message to wait for
 * @param[in] timeout Number of milliseconds to wait for
 * @return Pointer to the message user content, NULL if it timed-out
 */
extern void *rtos_msg_wait(uint16_t id, uint16_t timeout);

/**
 * Store a message in the saved messages list of the thread
 * @param[in] pointer Pointer to the user content of the message to store in the save list
 * for later processing
 */
extern void rtos_msg_store(void *pointer);

/**
 * Restore the messages from the save list of the thread
 */
extern void rtos_msg_restore(void);

/**
 * Free an RTOS message
 * @param[in] pointer Pointer to the user content of the message to free
 */
extern void rtos_msg_free(void *pointer);

#endif // _RTOS_H_
