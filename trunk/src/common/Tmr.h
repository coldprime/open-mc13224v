/*
 * Single timer API
 *
 * This block provides an interface to a hardware timer.
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

#ifndef _TMR_H_
#define _TMR_H_

// standard includes
#include <stdint.h>

/**
 * Initialize the TMR peripheral.
 *
 * @warning Peripheral clock is expected to be 24MHz
 */
extern void
TmrInit(void);

/**
 * Function to call upon TMR peripheral FIQ.
 */
extern void
TmrFiq(void);

/**
 * Start a timer with a given delay.
 * @param[in] delay Number of milliseconds in which the timer should expire
 */
extern void
TmrStart(uint16_t delay);

/**
 * Stop the timer.
 */
extern void
TmrStop();


#endif // _TMR_H_
