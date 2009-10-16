/*
 * flasher.c
 *
 *  Created on: Oct 15, 2009
 *      Author: lcaron
 */
#include "Platform.h"
#include "UartLowLevel.h"
#include "Flash.h"

const char nibble[16]={'0','1','2','3','4','5','6','7', '8','9','a','b','c','d','e','f'};

static void
uart1_putc(char c)
{
    // wait for the TX FIFO to be non empty
    while (UART1_REGS_P->Utxcon == 0) ;

    // add a char to the TX FIFO
    UART1_REGS_P->Udata = (unsigned long)c;
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
    GPIO_REGS_P->DirLo = (7 << 23);

    // configure the GPIO15-14 to UART1 (UART1 TX and RX)
    GPIO_REGS_P->FuncSel0 = ((0x01 << (14*2)) | (0x01 << (15*2)));

    // clear the LEDs
    GPIO_REGS_P->DataLo = 0;
}

static void
InitUart1(void)
{
    // reinitialize the UART1: mask interrupts, 8x oversampling (BE CAREFUL, this is an
    // error in the reference manual)
    UART1_REGS_P->Ucon = 0x00006400;

    // UART1 baudrate: INC = 767, MOD = 9999, 8x oversampling -> 230400 baud @ 24 MHz
    UART1_REGS_P->Ubr = 767<<16 | 9999;

    // enable the UART TX and RX
    UART1_REGS_P->Ucon = 0x00006403;
}

void Main(void)
{
    // initialize the GPIOs for the application
    InitGpios();

    // initialize the UART1
    InitUart1();

    // start the NVM regulators

    while (1)
        uart1_puts("Ca y est");

}
