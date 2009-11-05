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
#include <stdint.h>


/// Definition of the events in the system, highest priority first
enum
{
    RTOS_E_THREADS_INDEX = 0,
    RTOS_E_FIQ_INDEX
};

/** Definition of the event bits for the raise operations the inversion (31-x) is used
 * to improve the scheduler timing with clz operation which returns the leftmost 0 count
 */
#define RTOS_E_MASK(x) (1<<(31-(x)))
#define RTOS_E_THREADS (RTOS_E_MASK(RTOS_E_THREADS_INDEX))
#define RTOS_E_FIQ (RTOS_E_MASK(RTOS_E_FIQ_INDEX))

/// Definition of the threads in the system
enum
{
    RTOS_T_THREAD0 = 0,
    RTOS_T_THREAD1
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
    /// Thread stack pointer location for storage when thread goes inactive
    uint32_t sp;

    /// Mask of the signals on which the thread is currently waiting
    uint32_t sigmask;
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
 */
extern void rtos_init(void);

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
 * Raise signals, this will release threads pending on anyone of these signals
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

#endif // _RTOS_H_
