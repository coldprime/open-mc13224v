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


#include "rtos_ac/rtos_ac.h"
#include "proc/proc.h"

#include "common/Uart1.h"

#include "reg_gpio.h"
#include "reg_crm.h"
#include "reg_itc.h"

#define ITC_CRM_INDEX (3)

// import symbols from the linker scripts
//extern char stack_base_svc;
//extern char heap_bottom;
//extern char heap_top;

__FIQ void FiqHandler(void)
{
}


extern struct task_desc task_desc_tab[];

void dump_ind1(char *str) {
    void **ptr = (void **) task_desc_tab[1].ind_queue;
    Uart1PutS(str);
    Uart1PutS(" ind1: ");
    for (;;) {
        Uart1PutU32((uint32_t)ptr);
        if(!ptr) break;
        ptr = (void **) *ptr;
        Uart1PutS("->");
    }
    Uart1PutS("\n");
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
    gpio_pad_pu_en0_set(gpio_pad_pu_en0_get() | (0xF1<<22));
    gpio_pad_pu_sel0_set(gpio_pad_pu_sel0_get() | (0xF1<<22));

    // + init data configuration
    //   * clear the LEDs
    gpio_data0_set(0);

    // ITC configuration:
    // enable CRM (3) in interrupt controller
    ennum_setf(3);
    inttype_setf(1<<3);

    // clear pending interrupts from the CRM after the GPIO PD/PU configuration is stable
    volatile uint32_t toto = 0;
    while (toto++ < 0x100000) ;

    crm_status_set(0xFFFF);
}




struct task_msg *task1(struct task_msg *msg)
{
    Uart1PutS("t1\n");

    uint32_t cnt = 0;

    for (;;) {
        //dump_ind1("A");
        struct task_msg *but = task_wait();
        //dump_ind1("B");

        Uart1PutS("t1 wait\n");

        ASSERT (but);
        switch (but->id) {
        case 0x10:
            cnt++;
            break;

        case 0x11: {
                task_send_req(task_malloc(0x20,cnt), 2);
                break;
            }

        case 0x12: {
                task_send_req(task_malloc(0x20,cnt), 3);
                break;
            }
        }

        mem_free(but);

    }

    return NULL; //(struct task_msg *)0x123;
}

struct task_msg *task2(struct task_msg *msg)
{
    Uart1PutS("t2: ");
    Uart1PutU32((uint32_t)msg->param);
    Uart1PutS("\n");

    mem_free(msg);

    struct task_msg *ind = task_wait();

    mem_free(ind);

    Uart1PutS("t2: end\n");

    return NULL;
}

struct task_msg *task3(struct task_msg *msg)
{
    Uart1PutS("t3: ");
    Uart1PutU32(msg->param);
    Uart1PutS("\n");

    mem_free(msg);

    struct task_msg *ind = task_wait();

    mem_free(ind);

    Uart1PutS("t3: end\n");

    return NULL;
}


//struct task_msg but_ind[5];

char heap[0x10000];


void Main(void)
{
    // initialize the whole platform
    InitPlatform();

    // initialize the UART1
    Uart1Init();

    mem_init(heap, heap + sizeof(heap));

    // detect the NVM type
    Uart1PutS("RTOS started: 0x");
    Uart1PutU32(0xCAFEBABE);
    Uart1PutS("\n");

    // initialize the Os
    //rtos_init(&heap_bottom, &heap_top);

    // release the interrupts
    //PROC_INT_START();

    task_asynch(1);

    //task_asynch(3);


    uint32_t gpio_led = 0;
    uint32_t gpio_prev = 0x3C400000;

    for(;;) {

        uint32_t gpio = gpio_data0_get();
        uint32_t gpio_diff = gpio_prev & ~gpio;
        gpio_prev = gpio;

        if (gpio_diff & BIT(26)) {
            //Uart1PutS("PB0\n");
            gpio_data0_set(gpio_led ^= (1<<23));

            //dump_ind1("C");
            task_send_ind(task_malloc(0x10,0x100), 1);
            //dump_ind1("D");
        }
        if (gpio_diff & BIT(27)) {
            //Uart1PutS("PB1\n");
            gpio_data0_set(gpio_led ^= (1<<24));

            task_send_ind(task_malloc(0x11,0x100), 1);
        }
        if (gpio_diff & BIT(28)) {
            //Uart1PutS("PB2\n");
            gpio_data0_set(gpio_led ^= (1<<25));

            task_send_ind(task_malloc(0x12,0x100), 1);
        }
        if (gpio_diff & BIT(29)) {
            //Uart1PutS("PB3\n");
            gpio_data0_set(gpio_led = (7<<23));

            task_send_ind(task_malloc(0x13,0x100), 2);
        }
        if (gpio_diff & BIT(22)) {
            //Uart1PutS("PB4\n");
            gpio_data0_set(gpio_led = 0);

            task_send_ind(task_malloc(0x14,0x100), 3);
        }

        //Uart1PutS(".");

        task_schedule();

        WAIT(1);

    }



//    while (1);

    // schedule the next thread, should never return, pass the base pointer of the stack
    //rtos_scheduler((uint32_t*)&stack_base_svc);
}

