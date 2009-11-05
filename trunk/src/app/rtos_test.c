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
#include "proc.h"

#include "Uart1.h"

#include "reg_gpio.h"
#include "reg_crm.h"
#include "reg_itc.h"

// import symbol from the linker scripts
extern char stack_base_svc;

__FIQ void FiqHandler(void)
{
    // clear any pending interrupt
    crm_status_set(0xFFFF);

    Uart1PutS("FIQ\n");
}

void fiq_event(void)
{

}

void Thread0(void)
{
    uint32_t cnt = 0;

    Uart1PutS("Thread0 started\n");
    while (1)
    {
        // raise signal 2
        rtos_sigraise(2);

        // wait for signal 1
        rtos_sigwait(1);

        Uart1PutS("T0:");
        Uart1PutU32(cnt);
        Uart1PutS("\n");
        cnt++;
    }
}

void Thread1(void)
{
    uint32_t cnt = 0xFFFFFFFF;

    Uart1PutS("Thread1 started\n");
    while (1)
    {
        // raise signal 1
        rtos_sigraise(1);

        // wait for signal 2
        rtos_sigwait(2);

        Uart1PutS("T1:");
        Uart1PutU32(cnt);
        Uart1PutS("\n");
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
    // CRM configuration:
    // + system configuration
    //   * the clock frequency for the whole platform to 24MHz (divider = 0)
    //   * JTAG security enforced off
    //   * SPIF uses 1.8
    //   * power source is VBATT
    crm_sys_cntl_pack(0, 0, 1, 1, 0, 0);

    // + wakeup configuration
    //   + enable WU pads and interrupts
    //   + configure edge detection on low transition
    crm_wu_cntl_set((crm_wu_cntl_get() & ~EXT_WU_POL_MASK) |
            EXT_WU_IEN_MASK | EXT_WU_EN_MASK | EXT_WU_EDGE_MASK);

    // + status configuration
    //   * clear any pending interrupt
    crm_status_set(0xFFFF);

    // GPIO configuration:
    // + direction configuration
    //   * configure the GPIOs 25-23 as output (KBI3-KBI1), connect to LED control
    gpio_pad_dir0_set(7 << 23);

    // + function configuration
    //   * configure the GPIO15-14 to UART1 (UART1 TX and RX)
    gpio_func_sel0_set((0x01 << (14*2)) | (0x01 << (15*2)));

    // + pull up configuration
    //   * enable the PU on the KBI[7..4] pads
    gpio_pad_pu_en0_set(gpio_pad_pu_en0_get() | (0xF<<26));
    gpio_pad_pu_sel0_set(gpio_pad_pu_sel0_get() | (0xF<<26));

    // + init data configuration
    //   * clear the LEDs
    gpio_data0_set(0);

    // ITC configuration:
    // enable CRM (3) in interrupt controller
    ennum_setf(3);
    inttype_setf(1<<3);

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
    rtos_init();

    // release the interrupts
    PROC_INT_START();

    // schedule the next thread, should never return, pass the base pointer of the stack
    rtos_scheduler((uint32_t*)&stack_base_svc);
}

