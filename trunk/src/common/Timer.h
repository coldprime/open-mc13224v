/*
 * Timer related API
 *
 * This block provides an interface to a system timer.
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

#ifndef _TIMER_H_
#define _TIMER_H_

// standard includes
#include <stdint.h>

/**
 * Initialize the timer API.
 *
 * @warning Peripheral clock is expected to be 24MHz
 */
extern void
TimerInit(void);

/**
 * Function to call upon TMR peripheral FIQ.
 */
extern void
TimerInt(void);

/**
 * Start a timer with a given delay.
 * @param[in] delay Number of milliseconds in which the timer should expire
 */
extern void
TimerStart(uint16_t delay);

/**
 * Stop the timer.
 */
extern void
TimerStop(void);

/**
 * Get the current timer value.
 * @return The current timer value in milliseconds.
 */
extern uint16_t
TimerGet(void);

#endif // _TIMER_H_
