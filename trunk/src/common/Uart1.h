/*
 * UART1 related API
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

#ifndef _UART1_H_
#define _UART1_H_

// standard includes
#include <stdint.h>

/**
 * Initialize the UART peripheral.
 */
extern void
Uart1Init(void);

/**
 * Flush the receive path of the UART peripheral.
 */
extern void
Uart1FlushRx(void);

/**
 * Append a char to the UART peripheral FIFO.
 * @param c Char to add to the FIFO
 */
extern void
Uart1PutC(char c);

/**
 * Append a string to the UART peripheral FIFO.
 * @param s String to add to the FIFO
 */
extern void
Uart1PutS(char const *s);

/**
 * Format an 8-bit unsigned value into a string and append it to the UART peripheral FIFO.
 * @param v Value to convert into a string
 */
extern void
Uart1PutU8(uint8_t v);

/**
 * Format a 16-bit unsigned value into a string and append it to the UART peripheral FIFO.
 * @param v Value to convert into a string
 */
extern void
Uart1PutU16(uint16_t v);

/**
 * Format a 32-bit unsigned value into a string and append it to the UART peripheral FIFO.
 * @param v Value to convert into a string
 */
extern void
Uart1PutU32(uint32_t v);

#endif // _UART1_H_
