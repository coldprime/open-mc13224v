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

#define RTOS_STACK_SIZE (128)

/// Description of a thread from the scheduler point of view
struct thread
{
    /// Thread allocated stack
    uint32_t stack[RTOS_STACK_SIZE];

    /// Stack pointer when saving
    uint32_t sp;
};

struct rtos
{
    /// Thread array
    struct thread threads[2];

    /// Current thread
    uint8_t current;

    /// Stack pointer when saving
    uint32_t sp;
};

/// RTOS environment
extern struct rtos rtos_env;

/// Yield to the next thread
extern void rtos_yield(void);

/// Switch between threads
extern void rtos_switch(uint32_t *sp_new, uint32_t *sp_old);

extern void rtos_create(uint32_t *sp_save, void(*fn)(void), uint32_t *stack);

/// Initialize the RTOS
extern void rtos_init(void);

/// Scheduler main entry point
extern void rtos_scheduler(void);

#endif // _RTOS_H_
