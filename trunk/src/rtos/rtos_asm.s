.text
    .align  4

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

    # read the current status register in the scratch r2
    mrs r2, cpsr

    # save the return address in scratch r3
    mov r3, lr

    # save the registers
    stmdb sp!, {r2-r11}

    # save the SP in the location specified by sp_old
    STR sp, [r1]

    # load the new SP
    LDR sp, [r0]

    # restore the saved registers
    ldmia sp!, {r2-r11}

    # restore previous status register
    msr cpsr, r2

    # return to caller
    bx r3


# extern void rtos_create(uint32_t *sp_save, void(*fn)(void), uint32_t *stack);
.global rtos_create
.type   rtos_create, function
rtos_create:
    # r0 is sp_save
    # r1 is fn
    # r2 is stack
    # r3 is scratch unused
    # r12 is IP (Intra-Procedure-call scratch register) therefore scratch

    # temporarily save the stack pointer
    mov r12, sp

    # use the stack passed as parameter
    mov sp, r2

    # read the current status register in the scratch r2
    mrs r2, cpsr

    # save the return address in scratch r3 (return is function entry)
    mov r3, r1

    # save the registers
    stmdb sp!, {r2-r11}

    # save the SP in the location specified by sp_save
    str sp, [r0]

    # restore the initial stack pointer
    mov sp, r12

    # return to caller
    bx lr


