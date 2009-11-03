/*
 * RTOS test application.
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

#include "Uart1.h"

#include "reg_gpio.h"
#include "reg_crm.h"

void Thread1(void)
{
    uint32_t cnt = 0;

    Uart1PutS("Thread1 started\n");
    while (1)
    {
        Uart1PutS("T1:");
        Uart1PutU32(cnt);
        Uart1PutS("\n");
        rtos_yield();
        cnt++;
    }
}

void Thread2(void)
{
    uint32_t cnt = 0xFFFFFFFF;

    Uart1PutS("Thread2 started\n");
    while (1)
    {
        Uart1PutS("T2:");
        Uart1PutU32(cnt);
        Uart1PutS("\n");
        rtos_yield();
        cnt--;
    }
}

/**
 * Set the basic configuration for the whole platform.  This can vary with the
 * application.
 */
static void
InitPlatform(void)
{
    // set:
    //   - the clock frequency for the whole platform to 24MHz (divider = 0)
    //   - JTAG security enforced off
    //   - SPIF uses 1.8
    //   - power source is VBATT
    crm_sys_cntl_pack(0, 0, 1, 1, 0, 0);

    // GPIOS
    // configure the GPIOs 25-23 as output (KBI3-KBI1), connect to LED control
    gpio_pad_dir0_set(7 << 23);

    // configure the GPIO15-14 to UART1 (UART1 TX and RX)
    gpio_func_sel0_set((0x01 << (14*2)) | (0x01 << (15*2)));

    // clear the LEDs
    gpio_data0_set(0);
}


/**
 * Initialize the elements of the Operating System.
 */
static void InitOs(void)
{
    // create the tasks
    rtos_create(&rtos_env.threads[0].sp, Thread1, &rtos_env.threads[0].stack[RTOS_STACK_SIZE]);
    rtos_create(&rtos_env.threads[1].sp, Thread2, &rtos_env.threads[1].stack[RTOS_STACK_SIZE]);

}

void Main(void)
{
    // initialize the whole platform
    InitPlatform();

    // initialize the UART1
    Uart1Init();

    // detect the NVM type
    Uart1PutS("RTOS started: 0x");
    Uart1PutU32(0xCAFEBABE);
    Uart1PutS("\n");

    // initialize the Os
    InitOs();

    // start the scheduler, should never return
    rtos_scheduler();
}

