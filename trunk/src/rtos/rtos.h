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
#include <stdbool.h>

#define RTOS_TASK_NUM (2)
#define RTOS_STACK_SIZE (128)

/// Description of a thread from the scheduler point of view
struct thread
{
    /// Thread allocated stack
    uint32_t stack[RTOS_STACK_SIZE];

    /// Thread stack pointer location for storage when thread goes inactive
    uint32_t sp;

    /// Mask of the signals on which the thread is currently waiting
    uint32_t sigmask;
};

/// RTOS main environment
struct rtos
{
    /// Thread array
    struct thread threads[2];

    /// Current thread
    uint32_t current;

    /// Background stack pointer location for storage when no more threads active
    uint32_t sp;

    /// Mask of the events that are set
    uint32_t eventmask;
};

/// RTOS environment
extern struct rtos rtos_env;

/// Switch between threads
extern void rtos_switch(uint32_t *sp_new, uint32_t *sp_old);

/// Create a thread context
extern void rtos_create(uint32_t *sp_save, void(*fn)(void), uint32_t *stack);

/// Initialize the RTOS
extern void rtos_init(void);

/**
 * Launch the RTOS scheduler, this function never returns
 *
 * @param stack Pointer to the first word above the stack (full descending stack)
 */
extern void rtos_scheduler(uint32_t *stack);

/**
 * Wait for any signal in a signal mask
 *
 * @param sigmask Mask of the signals to wait for
 */
void rtos_eventwait(uint32_t sigmask);

/**
 * Raise signal mask, this will awaken threads pending on anyone of these signals
 *
 * @param sigmask Mask of the signals to raise
 */
void rtos_sigraise(uint32_t sigmask);

#endif // _RTOS_H_
