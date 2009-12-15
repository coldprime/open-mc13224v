/*
 * Timer related API
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
#include "Timer.h"

// include the timers registers
#include "reg_tmr0.h"
#include "reg_tmr1.h"

// for the debug interface
#include "common/Uart1.h"

void
TimerInit(void)
{
    // configure timer 0:
    //    - count rising edges
    //    - primary source = peripheral clock
    //    - count repeatedly and reinitializes once compare reached
    //    - count up
    //    - no co_init and no OFLAG
    tmr0_ctrl_pack(0, 8, 0, 0, 1, 0, 0, 0);
    tmr0_sctrl_set(0);
    tmr0_csctrl_set(0);
    //    - upon compare reached, reload to 0
    tmr0_load_set(0);
    //    - count up to 24000 to count milliseconds
    tmr0_comp1_set(24000);

    // configure timer 1:
    //    - count rising edges
    //    - primary source = counter0 output
    //    - count only once and stop
    //    - count up
    //    - no co_init and no OFLAG
    tmr1_ctrl_pack(0, 4, 0, 1, 0, 0, 0, 0);
    //    - enable interrupt upon successful compare
    tmr1_sctrl_pack(0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
    tmr1_csctrl_set(0);
}

void
TimerInt(void)
{
    Uart1PutS("\nTMR FIQ: CTRL = 0x");
    Uart1PutU16(TMR1_CTRL_REG);
    Uart1PutS(", SCTRL = 0x");
    Uart1PutU16(TMR1_SCTRL_REG);
    Uart1PutS(", CSCTRL = 0x");
    Uart1PutU16(TMR1_CSCTRL_REG);

    // clear the timer compare flag interrupt
    tmr1_tcf_setf(0);

    Uart1PutS("\nTMR FIQ: SCTRL = 0x");
    Uart1PutU16(TMR1_SCTRL_REG);
}

void
TimerStart(uint16_t delay)
{
    // by default, stop any current timer running
    TimerStop();

    // set the delay in which the timer should expire
    tmr1_comp1_set(delay);

    // reinitialize the timer
    tmr0_cntr_set(0);
    tmr1_cntr_set(0);

    // start timer 0 millisecond count
    tmr0_count_mode_setf(1);
    // start timer 1 single shot synchronous
    tmr1_count_mode_setf(7);
}

void
TimerStop(void)
{
    // disable timers 0 and 1
    tmr0_count_mode_setf(0);
    tmr1_count_mode_setf(0);
}

uint16_t
TimerGet(void)
{
    return tmr1_cntr_get();
}
