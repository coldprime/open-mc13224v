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

#include "Uart1.h"

#include "reg_uart1.h"

static const char nibble[16] =
    {'0','1','2','3','4','5','6','7', '8','9','A','B','C','D','E','F'};

void
Uart1Init(void)
{
    // reinitialize the UART1: mask interrupts, 8x oversampling (BE CAREFUL, this is an
    // error in the reference manual)
    uart1_ucon_set(MRXR_BIT|MTXR_BIT|XTIM_BIT);

    // UART1 baudrate: INC = 767, MOD = 9999, 8x oversampling -> 230400 baud @ 24 MHz
    uart1_ubr_pack(767, 9999);

    // enable the UART TX and RX
    uart1_ucon_set(MRXR_BIT|MTXR_BIT|XTIM_BIT|RXE_BIT|TXE_BIT);
}

void
Uart1FlushRx(void)
{
    uint32_t c;

    while (uart1_urxcon_get() != 0)
    {
        c = uart1_udata_get();
    }
}

void
Uart1PutC(char c)
{
    // wait for the TX FIFO to be non empty
    while (uart1_utxcon_get() == 0) ;

    // add a char to the TX FIFO
    uart1_udata_set(c);
}

void
Uart1PutS(char const *s)
{
    while (*s != 0)
    {
        Uart1PutC(*s);
        s++;
    }
}

void
Uart1PutU8(uint8_t v)
{
    Uart1PutC(nibble[v >> 4]);
    Uart1PutC(nibble[v & 0xF]);
}

void
Uart1PutU16(uint16_t v)
{
    Uart1PutU8(v >> 8);
    Uart1PutU8(v & 0xFF);
}

void
Uart1PutU32(uint32_t v)
{
    Uart1PutU16(v >> 16);
    Uart1PutU16(v & 0xFFFF);
}

char
Uart1GetC(void)
{
    // wait for at least one char to be received from the UART
    while (uart1_urxcon_get() == 0) ;

    // return the char
    return (char)udata_getf();
}
