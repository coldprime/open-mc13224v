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

#include "rtos.h"

struct rtos rtos_env;


void rtos_init(void)
{
    // initialize the RTOS
}

void rtos_scheduler(void)
{
    // switch to the first task
    rtos_switch(&rtos_env.threads[0].sp, &rtos_env.sp);
}

void rtos_yield(void)
{
    uint8_t old;

    // this is a fake switch selection : move to the next thread
    old = rtos_env.current;
    rtos_env.current = (rtos_env.current + 1)%2;

    // this function should be called from the current running task
    rtos_switch(&rtos_env.threads[rtos_env.current].sp, &rtos_env.threads[old].sp);
}


