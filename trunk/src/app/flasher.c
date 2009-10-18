/*
 * Flasher application: receive a binary through the UART and save it into the NVM.
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

//#include "Platform.h"
//#include "UartLowLevel.h"
#include "Flash.h"

#include "reg_gpio.h"
#include "reg_uart1.h"

const char nibble[16]={'0','1','2','3','4','5','6','7', '8','9','a','b','c','d','e','f'};

static void
uart1_putc(char c)
{
    // wait for the TX FIFO to be non empty
    while (uart1_utxcon_get() == 0) ;

    // add a char to the TX FIFO
    uart1_udata_set(c);
}

static void
uart1_puts(char const *s)
{
    while (*s != 0)
    {
        uart1_putc(*s);
        s++;
    }
}

static void
uart1_put_u8(uint8_t v)
{
    uart1_putc(nibble[v >> 4]);
    uart1_putc(nibble[v & 0xF]);
}

static void
uart1_put_u16(uint16_t v)
{
    uart1_put_u8(v >> 8);
    uart1_put_u8(v & 0xFF);
}

static void
uart1_put_u32(uint32_t v)
{
    uart1_put_u16(v >> 16);
    uart1_put_u16(v & 0xFFFF);
}

static void
InitGpios(void)
{
    // configure the GPIOs 25-23 as output (KBI3-KBI1), connect to LED control
    gpio_pad_dir0_set(7 << 23);

    // configure the GPIO15-14 to UART1 (UART1 TX and RX)
    gpio_func_sel0_set((0x01 << (14*2)) | (0x01 << (15*2)));

    // clear the LEDs
    gpio_data0_set(0);
}

static void
InitUart1(void)
{
    // reinitialize the UART1: mask interrupts, 8x oversampling (BE CAREFUL, this is an
    // error in the reference manual)
    uart1_ucon_set(MRXR_BIT|MTXR_BIT|XTIM_BIT);

    // UART1 baudrate: INC = 767, MOD = 9999, 8x oversampling -> 230400 baud @ 24 MHz
    uart1_ubr_pack(767, 9999);

    // enable the UART TX and RX
    uart1_ucon_set(MRXR_BIT|MTXR_BIT|XTIM_BIT|RXE_BIT|TXE_BIT);
}

void Main(void)
{
    // initialize the GPIOs for the application
    InitGpios();

    // initialize the UART1
    InitUart1();

    // start the NVM regulators

    while (1)
        uart1_puts("Ca y est, sans le FS!");

}
