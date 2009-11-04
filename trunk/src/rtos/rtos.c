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

/// Schedule the next thread in the RTOS
static void rtos_schedule(void)
{
    int cnt;

rtos_schedule_restart:
    for (cnt = 0; cnt < RTOS_TASK_NUM; cnt++)
    {
        if (rtos_env.threads[cnt].eventmask == 0)
        {
            // save the current thread index
            rtos_env.current = cnt;

            // switch between the current task and the new one to schedule
            rtos_switch(&rtos_env.threads[cnt].sp, &rtos_env.sp);

            goto rtos_schedule_restart;
        }
    }
}

void rtos_init(void)
{
    // initialize the RTOS
}

void rtos_scheduler(uint32_t *stack)
{
    do
    {
        // try to schedule a new RTOS element
        rtos_schedule();

        // if we reach here it means that there are no active threads or signals pending


    } while (1);
}

void rtos_eventwait(uint32_t eventmask)
{
    // wait for any of the events in the event mask
    rtos_env.threads[rtos_env.current].eventmask = eventmask;

    // switch back to the scheduler
    rtos_switch(&rtos_env.sp, &rtos_env.threads[rtos_env.current].sp);
}

void rtos_eventraise(uint32_t eventmask)
{
    int cnt;
    for (cnt = 0; cnt < RTOS_TASK_NUM; cnt++)
    {
        if (rtos_env.threads[cnt].eventmask & eventmask)
        {
            // unlock the thread
            rtos_env.threads[cnt].eventmask = 0;
        }
    }
}
