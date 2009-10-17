/*
 * Dummy application.
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

#include <stdint.h>
#include "Platform.h"
#include "UartLowLevel.h"

#define reg(x) (*(volatile uint32_t *)(x))

void UartReadCallback(UartReadCallbackArgs_t* args)
{

}

void UartWriteCallback(UartWriteCallbackArgs_t* args)
{

}

void Error(const char *message)
{
    // reset the system to write something
    GPIO_REGS_P->DirLo = 0x00000100;

    // force the /* mask interrupts, 16 bit sample --- helps explain the baud rate */
    UART1_REGS_P->Ucon = 0x00006400;

    /* INC = 767; MOD = 9999 works: 115200 @ 24 MHz 16 bit oversampling */
    #define INC 767
    #define MOD 9999
    UART1_REGS_P->Ubr = INC<<16 | MOD;

    UART1_REGS_P->Ucon = 0x00006403;

    GPIO_REGS_P->FuncSel0 = ( (0x01 << (14*2)) | (0x01 << (15*2)) ); /* set GPIO15-14 to UART (UART1 TX and RX)*/

    while (*message != 0)
    {
        // wait for the TX FIFO to be non empty
        while (UART1_REGS_P->Utxcon == 0) ;

        // add a char to the TX FIFO
        UART1_REGS_P->Udata = (unsigned long)*message;

        message++;
    }

    while (1);
}

void Main(void)
{
#if 0
    volatile uint32_t *ptr = 0x8000c010;
    for(;;)
    {
        while (*ptr == 0) ;

        ITC_Init();
    }

    {
#define GPIO_PAD_DIR0   0x80000000
#define GPIO_FUNC_SEL0  0x80000018 /* GPIO 15 - 0;  2 bit blocks */
#define UART1_CON       0x80005000
#define UART1_DATA      0x80005008
#define UT1CON          0x80005010
#define UART1_BR        0x80005018

        reg(GPIO_PAD_DIR0) = 0x00000100;

        /* Restore UART regs. to default */
        /* in case there is still bootloader state leftover */

        reg(UART1_CON) = 0x0000c800; /* mask interrupts, 16 bit sample --- helps explain the baud rate */

        /* INC = 767; MOD = 9999 works: 115200 @ 24 MHz 16 bit sample */
        #define INC 767
        #define MOD 9999
        reg(UART1_BR) = INC<<16 | MOD;

        /* see Section 11.5.1.2 Alternate Modes */
        /* you must enable the peripheral first BEFORE setting the function in GPIO_FUNC_SEL */
        /* From the datasheet: "The peripheral function will control operation of the pad IF */
        /* THE PERIPHERAL IS ENABLED. */
        reg(UART1_CON) = 0x00000003; /* enable receive and transmit */
        reg(GPIO_FUNC_SEL0) = ( (0x01 << (14*2)) | (0x01 << (15*2)) ); /* set GPIO15-14 to UART (UART1 TX and RX)*/

        while (1)
        {
            UartWriteData(UART_1, "T", 1);
//            while(reg(UT1CON)==31); /* wait for there to be room in the buffer */
//            reg(UART1_DATA) = 'O';
        }

    }
#endif


    UartConfig_t uartconfig;
    UartCallbackFunctions_t uartcb;

    // call the initialization of the UART
//    UartInit();

    reg(0x80000000) = 0x00000100;

    // open the UART port
    if (UartOpen(UART_1, 24000))
    {
        Error("Can not open UART.");
    }

    // configure the UART port
    uartconfig.UartBaudrate = 115200;
    uartconfig.UartParity = gUartParityNone_c;
    uartconfig.UartStopBits = gUartStopBits1_c;
    uartconfig.UartFlowControlEnabled = 0;
    if (UartSetConfig(UART_1, &uartconfig))
    {
        Error("Can not set UART config.");
    }

    // configure the UART callbacks
    uartcb.pfUartReadCallback = UartReadCallback;
    uartcb.pfUartWriteCallback = UartWriteCallback;
    if (UartSetCallbackFunctions(UART_1, &uartcb))
    {
        Error("Can not set UART callbacks.");
    }

    reg(0x80000018) = ( (0x01 << (14*2)) | (0x01 << (15*2)) ); /* set GPIO15-14 to UART (UART1 TX and RX)*/

    while (1)
    {
        UartErr_t error;

        error = UartWriteData(UART_1, "T", 1);
        if (error)
        {
            Error("Can not write data");
        }
        switch(error)
        {
        case gUartErrNoError_c:
            break;
        case gUartErrWrongUartNumber_c:
            Error("Can not write data: wrong UART number");
            break;
        case gUartErrNullPointer_c:
            Error("Can not write data: NULL pointer");
            break;
        case gUartErrInvalidNrBytes_c:
            Error("Can not write data: invalid bytes number");
            break;
        case gUartErrUartNotOpen_c:
            Error("Can not write data: UART not open");
            break;
        case gUartErrWriteOngoing_c:
            Error("Can not write data: write ongoing");
            break;
        case gUartErrNoCallbackDefined_c:
            Error("Can not write data: no cb defined");
            break;
        default:
            Error("Can not write data: unknown error");
            break;
        }

//        while (1);
    }
}
