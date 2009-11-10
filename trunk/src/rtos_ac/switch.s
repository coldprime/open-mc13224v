


.text
    .align  4
    .global context_switch
    .type   context_switch, function
    .global context_switch2
    .type   context_switch2, function

/*  r0 : pointer to custom parameter
    r1 : pointer to init context of new task, which contains :
    r2 : pointer to context of current task, to save registers
*/
context_switch:

    /* save current registers in old context pointed by r0 */
    stmia   r2, {r4-r11, r13, r14}

context_switch2:
    /* restore registers with new context pointed by r1 */
    ldmia   r1, {r4-r11, r13, r14}

    /* return to new context, beware of thumb mode! */
    bx      r14




/*  r0 : pointer to custom parameter
    r1 : pointer to init context of new task, which contains :
        - sp: pointer to end of task stack
        - lr: pointer to ending routine
        - pc: pointer to entry routine
    r2 : pointer to context of current task, to save registers
*/
    .align  4
    .global context_start
    .type   context_start, function
    .global context_start2
    .type   context_start2, function

context_start:
    /* save current registers in old context pointed by r1 */
    stmia   r2, {r4-r11, r13, r14}

context_start2:
    /* update registers with new context pointed by r2.
       will jump to entry routine with r0 pointer to custom parameter.
       beware of thumb mode!  */
    ldmia   r1, {r13, r14, r15}




