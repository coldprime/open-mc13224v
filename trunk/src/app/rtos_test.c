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


#include "rtos/rtos.h"
#include "proc/proc.h"

#include "common/Uart1.h"

#include "reg_gpio.h"
#include "reg_crm.h"
#include "reg_itc.h"

#define ITC_CRM_INDEX (3)

// import symbols from the linker scripts
extern char stack_base_svc;
extern char heap_bottom;
extern char heap_top;

enum
{
    PB0_IND = 0,
    PB0_RSP,
    PB0_REQ,
    PB0_CFM,
    PB1_IND = 0x100,
    PB1_RSP,
    PB1_REQ,
    PB1_CFM,
};

__FIQ void FiqHandler(void)
{
    uint8_t fiq;

    // check were the FIQ is coming from
    fiq = fivector_getf();

    switch (fiq)
    {
    case ITC_CRM_INDEX:
        fiq = ext_wu_evt_getf();


        Uart1PutS("CRM\n");

        if (fiq & 1)
        {
            rtos_eventraise(RTOS_EVENT(PB0));
            Uart1PutS("PB0\n");
        }
        if (fiq & 2)
        {
            rtos_eventraise(RTOS_EVENT(PB1));
            Uart1PutS("PB1\n");
        }
        if (fiq & 4)
        {
            rtos_eventraise(RTOS_EVENT(PB2));
            Uart1PutS("PB2\n");
        }
        if (fiq & 8)
        {
            rtos_eventraise(RTOS_EVENT(PB3));
            Uart1PutS("PB3\n");
        }
        // clear any pending interrupt
        crm_status_set(0xFFFF);
    break;
    default:
        Uart1PutS("Unsupported FIQ\n");
        ASSERT(0);
        break;
    }
}

void event_pb0(void)
{
    Uart1PutS("EVT_PB0\n");

    // send an indication to the thread0
    rtos_msg_post(RTOS_T_THREAD0, PB0_IND, 0);

    rtos_eventclear(RTOS_EVENT(PB0));
}

void event_pb1(void)
{
    Uart1PutS("EVT_PB1\n");

    // send an indication to the thread1
    rtos_msg_post(RTOS_T_THREAD1, PB1_IND, 0);

    rtos_eventclear(RTOS_EVENT(PB1));
}

void event_pb2(void)
{
    Uart1PutS("EVT_PB2\n");

    rtos_eventclear(RTOS_EVENT(PB2));
}

void event_pb3(void)
{
    Uart1PutS("EVT_PB3\n");

    rtos_eventclear(RTOS_EVENT(PB3));
}

void Thread0(void)
{
    Uart1PutS("Thread0 started\n");
    while (1)
    {
        void *msg;
        uint8_t src;
        uint16_t id;

        // restore all saved messages
        rtos_msg_restore();

        // wait for the next incoming message
        msg = rtos_msg_get(&src, &id);

        switch (id)
        {
        case PB0_IND:
            Uart1PutS("Thread0: rx PB0_IND\n");

            // handle the message content
            rtos_msg_free(msg);

            // send message to Thread1
            rtos_msg_post(RTOS_T_THREAD1, PB1_REQ, 0);

            // wait for the response message
            do
            {
                msg = rtos_msg_get(&src, &id);

                if (id != PB1_CFM)
                {
                    rtos_msg_store(msg);
                }
            } while (id != PB1_CFM);

            Uart1PutS("Thread0: rx PB1_CFM\n");
            // handle the message content
            rtos_msg_free(msg);

            break;
        default:
            Uart1PutS("Thread0: unknown message received\n");
            break;
        }
    }
}

void Thread1(void)
{
    Uart1PutS("Thread1 started\n");
    while (1)
    {
        void *msg;
        uint8_t src;
        uint16_t id;

        // restore all saved messages
        rtos_msg_restore();

        // wait for the next incoming message
        msg = rtos_msg_get(&src, &id);

        switch (id)
        {
        case PB1_REQ:
        {
            uint8_t sender = src;

            Uart1PutS("Thread1: rx PB1_REQ\n");
            // handle the message content
            rtos_msg_free(msg);

            // wait for an indication from the PB1
            do
            {
                msg = rtos_msg_get(&src, &id);

                if (id != PB1_IND)
                {
                    rtos_msg_store(msg);
                }
            } while (id != PB1_IND);

            Uart1PutS("Thread1: rx PB1_IND\n");
            // handle the message content
            rtos_msg_free(msg);

            // send message to the sender of the request
            rtos_msg_post(sender, PB1_CFM, 0);

            break;
        }
        default:
            Uart1PutS("Thread1: unknown message received\n");
            break;
        }
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

    // clear pending interrupts from the CRM after the GPIO PD/PU configuration is stable
    {
        volatile uint32_t toto =0;
        while (toto++ < 10000) ;
    }
    crm_status_set(0xFFFF);

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
    rtos_init(&heap_bottom, &heap_top);

    // release the interrupts
    PROC_INT_START();

//    while (1);

    // schedule the next thread, should never return, pass the base pointer of the stack
    rtos_scheduler((uint32_t*)&stack_base_svc);
}

