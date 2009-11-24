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
#include <stdbool.h>

#include "common/Uart1.h"

#include "reg_gpio.h"
#include "reg_crm.h"

/***************************************************************************************/

#define BIT(x) (1<<(x))
#define WAIT(x) {volatile int z; for (z = 0; z <(x)*0x10000;z++);}

/***************************************************************************************/


#define TASK_CNT    3               // Number of task, 0 not included
#define TASK_STACK_SIZE    4000     // stack size for each task except 0

extern char task_stack[TASK_CNT][TASK_STACK_SIZE];  // task stacks

// task message; can be a request (synchronous) or an indication (async)
struct task_msg {
    struct task_msg     *next;      // ptr to next msg if in a queue
    uint32_t            sender_id;  // calling task (can be 0 if task does not want cfm)
    uint32_t            id;         // user value
    uint32_t            param;      // user value
};

// entering function of a task
typedef struct task_msg *task_entry_t(struct task_msg *);
// actual entering functions
struct task_msg *task1(struct task_msg *);
struct task_msg *task2(struct task_msg *);
struct task_msg *task3(struct task_msg *);

// terminating handler of a task
typedef void task_end_t(void*);
// actual terminating handler
void task_ending_handler(void * rsp);


// initial value for registers when starting a task
struct task_reg_init {
    char            *init_sp;       // R13 init value, end of stack buffer
    task_end_t      *init_lr;       // R14 init value
    task_entry_t    *init_pc;       // R15 init value
};

// task environment
struct task_desc {
    uint32_t                reg_save[10];   // buffer for { R4-R11, R13, R14}
    bool                    started;        // task is running, waiting, blocked
    bool                    blocked;        // sync msg sent to another task
    struct task_reg_init    reg_init;       // inital registers value
    struct task_msg         *msg_req;       // request queue; msg are removed at the end of the task
    struct task_msg         *msg_ind;       // indication queue; msg a removed before processing
    struct task_msg         *msg_ind_proc;  // processed indication is moved here temporarly
};

struct task_msg *context_start(struct task_msg *req, struct task_reg_init *ctx_init, uint32_t *ctx_save);
struct task_msg *context_start2(struct task_msg *req, struct task_reg_init *ctx_init);
struct task_msg *context_switch(struct task_msg *req, uint32_t *ctx_restore, uint32_t *ctx_save);
struct task_msg *context_switch2(struct task_msg *req, uint32_t *ctx_restore);

/***************************************************************************************/


struct task_msg *task_malloc(uint32_t id, uint32_t param);
struct task_msg *task_start(struct task_msg *req, int task_id);
void task_send_ind(struct task_msg *ind, int task_id);
struct task_msg *task_send_req(struct task_msg *req, int task_id);
struct task_msg *task_schedule(void);
void task_ending_handler(void * rsp);
void *task_wait(void);


void mem_init(void* heap_bottom, void* heap_top);
void *mem_alloc(size_t size);
void mem_free(void *pointer);

/***************************************************************************************/
/***************************************************************************************/
/***************************************************************************************/


struct task_msg *task1(struct task_msg *msg);
struct task_msg *task2(struct task_msg *msg);
struct task_msg *task3(struct task_msg *msg);
