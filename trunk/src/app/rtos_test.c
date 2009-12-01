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

// defines for the timer block
#define REG_TMR_BASE_ADDR (0x80007000)

#define TMR0_COMP1_REG   (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x00))
#define TMR1_COMP1_REG   (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x20))
#define TMR2_COMP1_REG   (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x40))
#define TMR3_COMP1_REG   (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x60))
#define TMR0_COMP2_REG   (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x02))
#define TMR1_COMP2_REG   (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x22))
#define TMR2_COMP2_REG   (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x42))
#define TMR3_COMP2_REG   (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x62))
#define TMR0_CAPT_REG    (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x04))
#define TMR1_CAPT_REG    (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x24))
#define TMR2_CAPT_REG    (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x44))
#define TMR3_CAPT_REG    (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x64))
#define TMR0_LOAD_REG    (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x06))
#define TMR1_LOAD_REG    (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x26))
#define TMR2_LOAD_REG    (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x46))
#define TMR3_LOAD_REG    (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x66))
#define TMR0_HOLD_REG    (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x08))
#define TMR1_HOLD_REG    (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x28))
#define TMR2_HOLD_REG    (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x48))
#define TMR3_HOLD_REG    (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x68))
#define TMR0_CNTR_REG    (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x0A))
#define TMR1_CNTR_REG    (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x2A))
#define TMR2_CNTR_REG    (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x4A))
#define TMR3_CNTR_REG    (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x6A))
#define TMR0_CTRL_REG    (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x0C))
#define TMR1_CTRL_REG    (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x2C))
#define TMR2_CTRL_REG    (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x4C))
#define TMR3_CTRL_REG    (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x6C))
#define TMR0_SCTRL_REG   (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x0E))
#define TMR1_SCTRL_REG   (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x2E))
#define TMR2_SCTRL_REG   (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x4E))
#define TMR3_SCTRL_REG   (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x6E))
#define TMR0_CMPLD1_REG  (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x10))
#define TMR1_CMPLD1_REG  (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x30))
#define TMR2_CMPLD1_REG  (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x50))
#define TMR3_CMPLD1_REG  (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x70))
#define TMR0_CMPLD2_REG  (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x12))
#define TMR1_CMPLD2_REG  (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x32))
#define TMR2_CMPLD2_REG  (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x52))
#define TMR3_CMPLD2_REG  (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x72))
#define TMR0_CSCTRL_REG  (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x14))
#define TMR1_CSCTRL_REG  (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x34))
#define TMR2_CSCTRL_REG  (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x54))
#define TMR3_CSCTRL_REG  (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x74))

#define TMR_ENBL_REG     (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x1E))



// defines necessary for the ITC block
#define ITC_CRM_INDEX (3)
#define ITC_TMR_INDEX (5)

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

        Uart1PutS("CRM FIQ\n");

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

    case ITC_TMR_INDEX:
        Uart1PutS("TMR FIQ: SCTRL = 0x");
        Uart1PutU16(TMR0_SCTRL_REG);
        Uart1PutS(", CSCTRL = 0x");
        Uart1PutU16(TMR0_CSCTRL_REG);
        Uart1PutS("\n");
        TMR0_SCTRL_REG &= ~(1 << 15);
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
        {
            uint32_t *cfm;

            Uart1PutS("Thread0: rx PB0_IND\n");

            // handle the message content
            rtos_msg_free(msg);

            // send message to Thread1
            rtos_msg_post(RTOS_T_THREAD1, PB1_REQ, 0);

            // wait forever the response message (no timeout)
            cfm = rtos_msg_wait(PB1_CFM, 0);

            Uart1PutS("Thread0: rx PB1_CFM -> ");
            // check if the response is positive
            if (*cfm)
            {
                Uart1PutS("positive\n");
            }
            else
            {
                Uart1PutS("negative\n");
            }
            // handle the message content
            rtos_msg_free(cfm);

            break;
        }
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
            uint32_t *cfm;

            Uart1PutS("Thread1: rx PB1_REQ\n");
            // handle the message content
            rtos_msg_free(msg);

            // wait for an indication from the PB1 (timeout 48s)
            msg = rtos_msg_wait(PB1_IND, 48*1024);

            // send message to the sender of the request
            cfm = rtos_msg_post(sender, PB1_CFM, sizeof(*cfm));

            // check if the indication timed-out
            if (msg != NULL)
            {
                Uart1PutS("Thread1: rx PB1_IND\n");
                // handle the message content
                rtos_msg_free(msg);

                // indicate that it was successful
                *cfm = 1;
            }
            else
            {
                Uart1PutS("Thread1: PB1_IND timed-out\n");

                // indicate that it was not successful
                *cfm = 0;
            }

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
    // enable CRM and TMR in interrupt controller
    intenable_setf((1<<ITC_CRM_INDEX) | (1<<ITC_TMR_INDEX));
    inttype_setf((1<<ITC_CRM_INDEX) | (1<<ITC_TMR_INDEX));

    // clear pending interrupts from the CRM after the GPIO PD/PU configuration is stable
    {
        volatile uint32_t toto =0;
        while (toto++ < 10000) ;
    }
    crm_status_set(0xFFFF);

    // configure timer 0 (here the counter is not yet enabled)
    TMR0_CTRL_REG = (0 << 13) | (0xF << 9) | (1 << 6) | (1 << 5);
    TMR0_SCTRL_REG = (1 << 14);
//    TMR0_CSCTRL_REG = (1 << 14);
    TMR0_COMP1_REG = 0x1000;
//    TMR0_CMPLD1_REG = 0x1000;
    TMR0_CNTR_REG = 0;
    TMR0_LOAD_REG = 0;

    // start the timer
    TMR0_CTRL_REG |= (1 << 13);

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

