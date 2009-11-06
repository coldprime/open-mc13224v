/*
 * RTOS application: test an RTOS
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
#include <stddef.h>

#include "Uart1.h"

#include "reg_gpio.h"
#include "reg_crm.h"

/***************************************************************************************/


#define WAIT(x) {volatile int z; for (z = 0; z <(x)*0x10000;z++);}

/***************************************************************************************/


#define TASK_CNT    3
#define TASK_STACK_SIZE    4000

char task_stack[TASK_CNT][TASK_STACK_SIZE];

typedef void *task_entry_t(void*);
typedef void *task_end_t(void*);

void *task1(void*);
void *task2(void*);
void *task3(void*);


void *task_ending_handler(void * return_value);

struct task_reg_init {
    char            *init_sp;       // R13 init value, end of stack buffer
    task_end_t      *init_lr;       // R14 init value
    task_entry_t    *init_pc;       // R15 init value
};

struct task_desc;

struct task_msg {
    struct task_msg     *next;
    struct task_desc    *sender;
    uint32_t            id;
    uint32_t            param;
};

enum {
    TASK_RUN = 1,
    TASK_PROG = 2,
};

struct task_desc {
    uint32_t                reg_save[10];   // buffer for { R4-R11, R13, R14}
    bool                    started;
    bool                    blocked;
    struct task_reg_init    reg_init;
    struct task_msg         *msg_trig;
    struct task_msg         *msg_sleep;

} task_desc_tab[TASK_CNT + 1] = {
    { {0}, 1, {NULL,          NULL,                NULL},  NULL, NULL },
    { {0}, 0, {task_stack[1], task_ending_handler, task1}, NULL, NULL },
    { {0}, 0, {task_stack[2], task_ending_handler, task2}, NULL, NULL },
    { {0}, 0, {task_stack[3], task_ending_handler, task3}, NULL, NULL },
};

int task_current = 0;
//struct task_desc    *task_queue = NULL;

void switch_context(uint32_t *ctx_save, uint32_t *ctx_restore);
void start_context(struct task_msg *req, uint32_t *ctx_save, struct task_reg_init *ctx_init);

/***************************************************************************************/


struct task_msg *task_start(struct task_msg *req, int task_id)
{
    uint32_t * ctx_save = task_desc_tab[task_current].reg_save;

    task_desc_tab[task_id].started = 1;

    task_current = task_id;

    start_context(msg,
                  ctx_save,
                  &task_desc_tab[task_current].reg_init);
}



void task_asend(struct task_msg *msg, int task_id) {
    // must have 1 <= task_id <= TASK_CNT

    //if (task_desc_tab[task_id].blocked) {
    //    // find end of msg sleep queue and add msg
    //    struct task_msg *msg_ptr = (struct task_msg*) &task_desc_tab[task_id].msg_sleep;
    //    while (msg_ptr->next) msg_ptr = msg_ptr->next;
    //    msg_ptr->next = msg;
    //
    //} else
    {
        // find end of msg queue and add msg
        struct task_msg *msg_ptr = (struct task_msg*) &task_desc_tab[task_id].msg_trig;
        while (msg_ptr->next) msg_ptr = msg_ptr->next;
        msg_ptr->next = msg;

        // if sleeping msg, add them
        if (task_desc_tab[task_id].msg_sleep) {
            msg->next = task_desc_tab[task_id].msg_sleep;
            task_desc_tab[task_id].msg_sleep = NULL;
        }
    }

    //task_desc_tab[task_id].flag |= TASK_PROG;
}

struct task_msg *task_send(struct task_msg *req, int task_id) {

    struct task_msg *ret;

    task_asend(msg, task_id);

    task_desc_tab[task_current].blocked = 1;

    if (task_desc_tab[task_id].started == 0)
    {
        // return will be the called task!
        ret = task_start(req, task_id);
    }
    else
    {
        // run any other task
        // XXXXXX
        ret = task_schedule();
    }

    return ret;
}



void task_schedule(void)
{
    int task_new = task_current;
    for (;;) {
        task_new++;

        if (task_new == TASK_CNT + 1) {
            if (task_current == 0)
                return;
            task_new = 0;
            break;
        }

        if (task_desc_tab[task_new].started || task_desc_tab[task_new].req_queue)
            break;
    }

    if (task_desc_tab[task_new].flag & TASK_RUN{

    uint32_t * ctx_save;
    uint32_t * ctx_restore;

    ctx_save = task_desc_tab[task_current].reg_save;

    do {
        task_current++;
        if (task_current == TASK_CNT + 1)
            task_current = 0;
    } while (task_desc_tab[task_current].started == 0);

    ctx_restore = task_desc_tab[task_current].reg_save;

    switch_context(ctx_save, ctx_restore);
}

void *task_ending_handler(void * return_value)
{
    Uart1PutU32((uint32_t)return_value);
    Uart1PutS("end!\n");

    task_desc_tab[task_current].started = 0;

    task_schedule();

    return NULL;
}

/***************************************************************************************/
/***************************************************************************************/
/***************************************************************************************/


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




void *task1(void*b)
{
    volatile int j;

    Uart1PutS("1-");
    Uart1PutU32((uint32_t)b);

    //for (;;)
    {
        for (j = 0; j <0x4;j++)
            // switch
            task_schedule();
    }
    return (uint32_t)0x123;
}

void *task2(void*b)
{
    //volatile int i,j;
    for (;;)
    {
        Uart1PutS("2-");
        Uart1PutU32((uint32_t)b);
        WAIT(8);
        // switch
        task_schedule();
    }
    return NULL;
}

void *task3(void*b)
{
    volatile int i;
    for (i = 0; i <10; i++)
    {
        Uart1PutS("3-");
        Uart1PutU32((uint32_t)b);
        WAIT(16);
        // switch
        task_schedule();
    }
    return (uint32_t)0x465;
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


    //task_init();

    //Uart1PutS("init done\n");

    {
        volatile int i;

        task_start((uint32_t)0x123, 1);
        task_start((uint32_t)0x456, 2);
        task_start((uint32_t)0x789, 3);

        for (;;i++) {
            if (i%8) {
                Uart1PutS(".");
                WAIT(1);
            } else {
                WAIT(20);
            }

            // switch
            task_schedule();
        }
    }


    while (1) ;
}






