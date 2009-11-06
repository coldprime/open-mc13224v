


.text
    .align  4
    .global switch_context
    .type   switch_context, function

/*  r0 : pointer to context of current task, to save registers
    r1 : pointer to context of new task, to update registers
*/
switch_context:

    /* save current registers in old context pointed by r0 */
    stmia   r0, {r4-r11, r13, r14}

    /* restore registers with new context pointed by r1 */
    ldmia   r1, {r4-r11, r13, r14}

    /* return to new context, beware of thumb mode! */
    bx      r14




/*  r0 : pointer to custom parameter
    r1 : pointer to context of current task, to save registers
    r2 : pointer to init context of new task, which contains :
        - sp: pointer to end of task stack
        - lr: pointer to ending routine
        - pc: pointer to entry routine
*/
    .align  4
    .global start_context
    .type   start_context, function

start_context:
    /* save current registers in old context pointed by r1 */
    stmia   r1, {r4-r11, r13, r14}

    /* update registers with new context pointed by r2.
       will jump to entry routine with r0 pointer to custom parameter.
       beware of thumb mode!  */
    ldmia   r2, {r13, r14, r15}




