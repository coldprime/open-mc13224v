#/*
# * RTOS thread switch subroutines.
# *
# * Warning: in the following switch subroutines, the CPSR is not saved because in our
# * system, it is not needed.
# *
# *    Copyright (C) 2009 Louis Caron
# *
# *    This program is free software: you can redistribute it and/or modify
# *    it under the terms of the GNU General Public License as published by
# *    the Free Software Foundation, either version 3 of the License, or
# *    (at your option) any later version.
# *
# *    This program is distributed in the hope that it will be useful,
# *    but WITHOUT ANY WARRANTY; without even the implied warranty of
# *    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# *    GNU General Public License for more details.
# *
# *    You should have received a copy of the GNU General Public License
# *    along with this program.  If not, see <http://www.gnu.org/licenses/>.
# */

.text
    .align 4

#/**
# * Function to switch contexts
# */
# extern void rtos_switch(uint32_t *sp_new, uint32_t *sp_old);
.global rtos_switch
.type   rtos_switch, function
rtos_switch:
    # r0 is sp_new
    # r1 is sp_old
    # r2 is scratch unused
    # r3 is scratch unused
    # r12 is IP (Intra-Procedure-call scratch register) therefore scratch

    # CPSR is not saved because:
    #   - flag bits are supposed to be lost once in this function
    #   - control bits should always be the same (SVC, I)

    # save the registers
    stmdb sp!, {r4-r11, lr}

    # save the SP in the location specified by sp_old
    STR sp, [r1]

    # load the new SP
    LDR sp, [r0]

    # restore the saved registers
    ldmia sp!, {r4-r11, lr}

    # return to caller
    bx lr


#/**
# * Function to create a thread context on top of its stack
# */
# extern void rtos_create(uint32_t *sp_save, void(*fn)(void), uint32_t *stack);
.global rtos_create
.type   rtos_create, function
rtos_create:
    # r0 is sp_save
    # r1 is fn
    # r2 is stack
    # r3 is scratch unused
    # r12 is IP (Intra-Procedure-call scratch register) therefore scratch

    # CPSR is not saved because:
    #   - flag bits are supposed to be lost once in this function
    #   - control bits should always be the same (SVC, I)

    # temporarily save the stack pointer
    mov r12, sp

    # use the stack passed as parameter
    mov sp, r2

    # save the function pointer where the lr would be saved (on top)
    stmdb sp!, {r1}

    # then save the registers
    stmdb sp!, {r4-r11}

    # save the SP in the location specified by sp_save
    str sp, [r0]

    # restore the initial stack pointer
    mov sp, r12

    # return to caller
    bx lr


