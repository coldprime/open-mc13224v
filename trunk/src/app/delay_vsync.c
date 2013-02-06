/*
 * Generate a pattern on a GPIO
 *
 *    Copyright (C) 2009-2013 Louis Caron
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


#include "proc/proc.h"

#include "common/Uart1.h"

#include "reg_gpio.h"
#include "reg_crm.h"
#include "reg_itc.h"
#include "reg_tmr0.h"
#include "reg_tmr1.h"

// defines necessary for the ITC block
#define ITC_CRM_INDEX (3)

// use GPIO8 (TMR0) as the VSYNC output
#define VSYNC_OUT_GPIO (8)
// use GPIO9 (TMR1) as the VSYNC input
#define VSYNC_IN_GPIO (9)

__FIQ void FiqHandler(void)
{
    uint8_t fiq;

    // check were the FIQ is coming from
    fiq = itc_fivector_getf();

    switch (fiq)
    {
    case ITC_CRM_INDEX:
        fiq = crm_ext_wu_evt_getf();
        Uart1PutS("CRM FIQ\n");

        if (fiq & 1)
        {
            Uart1PutS("PB0\n");
            gpio_data_set0_set(1 << 23);
            gpio_data_reset0_set(6 << 23);
        }
        if (fiq & 2)
        {
            Uart1PutS("PB1\n");
            gpio_data_set0_set(2 << 23);
            gpio_data_reset0_set(5 << 23);
        }
        if (fiq & 4)
        {
            Uart1PutS("PB2\n");
            gpio_data_set0_set(4 << 23);
            gpio_data_reset0_set(3 << 23);
        }
        if (fiq & 8)
        {
            Uart1PutS("PB3\n");
        }

        // clear any pending interrupt
        crm_status_set(0xFFFF);
        break;
        
    default:
        Uart1PutS("Unsupported FIQ\n");
        break;
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

    // + ring oscillator configuration
    //   + tune the 2kHz oscillator (coarse=11, fine=24, dependent on every chip)
    crm_ringosc_cntl_pack(11, 24, 1);

    // + status configuration
    //   * clear any pending interrupt
    crm_status_set(0xFFFF);

    // GPIO configuration:
    // + direction configuration
    //   * configure the GPIOs 25-23 as output (KBI[3..1]), connected to LED control
    //   * configure the VSYNC out GPIO as output
    //   * configure the VSYNC in GPIO as output
    gpio_pad_dir_set0_set((7 << 23) | (1 << VSYNC_OUT_GPIO));
    gpio_pad_dir_reset0_set(1 << VSYNC_IN_GPIO);

    // + function configuration
    //   * configure the GPIO15-14 to UART1 (UART1 TX and RX)
    gpio_func_sel0_set((0x01 << (14*2)) | (0x01 << (15*2)));
    
    // + data select
    //   * read the VSYNC IN from the GPIO
    gpio_data_sel0_set(gpio_data_sel0_get() & (~(1 << VSYNC_IN_GPIO)));

    // + pull up configuration
    //   * enable the PU on the GPIO 29-26 (KBI[7..4]), connected to PushButtons
    gpio_pad_pu_en0_set(gpio_pad_pu_en0_get() | (0xF<<26));
    gpio_pad_pu_sel0_set(gpio_pad_pu_sel0_get() | (0xF<<26));

    // + init data configuration
    //   * turn on the red LED
    gpio_data0_set(1<<23);

    // ITC configuration:
    // enable CRM and TMR in interrupt controller
    itc_intenable_setf((1<<ITC_CRM_INDEX));
    itc_inttype_setf((1<<ITC_CRM_INDEX));

    // clear pending interrupts from the CRM after the GPIO PD/PU configuration is stable
    {
        volatile uint32_t toto =0;
        while (toto++ < 10000) ;
    }
    crm_status_set(0xFFFF);
}


void Main(void)
{
    uint32_t value, prev_value, state;
    
    // initialize the whole platform
    InitPlatform();

    // initialize the UART1
    Uart1Init();

    // release the interrupts
    PROC_INT_START();

    // configure timer 0:
    //    - count rising edges
    //    - primary source = peripheral clock divide by 128 (0xf)
    //    - count repeatedly
    //    - count up
    //    - no co_init and no OFLAG
    tmr0_ctrl_pack(1, 0xf, 0, 0, 0, 0, 0, 0);
    tmr0_sctrl_set(0);
    tmr0_csctrl_set(0);

    while (1)
    {
        // reinit the TMR0 counter
        tmr0_cntr_set(0);
        state = 0;

        do
        {
            // read the value of TIMER1
            value = gpio_data0_get() & (1 << VSYNC_IN_GPIO);
            
            if (prev_value != value)
            {
                prev_value = value;
                if (value)
                {
                    gpio_data_set0_set(1 << VSYNC_OUT_GPIO);
                }
                else
                {
                    gpio_data_reset0_set(1 << VSYNC_OUT_GPIO);
                }

            }

        } while (state == 0);
    }
}

