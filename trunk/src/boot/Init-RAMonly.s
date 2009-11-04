# list of init options
#.set CLEAR_BSS, 0

.section .vec, "ax"
    .align  4
    .global vector_reset

    # reset handler
vector_reset:
    B       boot_reset

    # undefined handler
vector_undefined:
    B       vector_undefined

    # SWI handler
vector_swi:
    B       vector_swi

    # Prefetch error handler
vector_pabort:
    B       vector_pabort

    # abort handler
vector_dabort:
    B       vector_dabort

    # reserved vector
vector_reserved:
    B       vector_reserved

    #  - IRQ
vector_irq:
    B       vector_irq

    #  - FIQ
    B       FiqHandler

    # this is here just for debug to return from an exception
    SUBS PC, LR, #4

.text
    .align  4

#/* ========================================================================
# *                                Constants
# * ======================================================================== */

.set BOOT_MODE_MASK, 0x1F

.set BOOT_MODE_USR, 0x10
.set BOOT_MODE_FIQ, 0x11
.set BOOT_MODE_IRQ, 0x12
.set BOOT_MODE_SVC, 0x13
.set BOOT_MODE_ABT, 0x17
.set BOOT_MODE_UND, 0x1B
.set BOOT_MODE_SYS, 0x1F

.set BOOT_FIQ_IRQ_MASK, 0xC0
.set BOOT_IRQ_MASK,     0x80


#/* ========================================================================
# *                                Macros
# * ======================================================================== */

#/* ========================================================================
#/**
# * Macro for switching ARM mode
# */
    .macro BOOT_CHANGE_MODE newmode
        MRS   R0, CPSR
        BIC   R0, R0, #BOOT_MODE_MASK
        ORR   R0, R0, #BOOT_MODE_\newmode
        MSR   CPSR_c, R0
    .endm

#/* ========================================================================
#/**
# * Macro for setting the stack
# */
    .macro BOOT_SET_STACK stackname
        LDR   R0, boot_stack_base_\stackname
        LDR   R1, boot_stack_len_\stackname
        ADD   R0, R0, R1
        MOV   SP, R0
    .endm



#/* ========================================================================
# *                                Globals
# * ======================================================================== */

#/* ========================================================================
#/**
# * RAM_BSS
# */
.ifdef CLEAR_BSS
ram_bss_base:
    .word bss_base

ram_bss_length:
    .word bss_length
.endif


#/* ========================================================================
# *                                Functions
# * ========================================================================

#/* ========================================================================
#/**
# * Function to handle reset vector
# */
boot_reset:
    # ==================
    # switch the FIQ mode and disable all interrupts
    MSR   CPSR_c, #BOOT_FIQ_IRQ_MASK | BOOT_MODE_FIQ
    LDR   R0, =stack_base_fiq
    MOV   SP, R0

    # Clear FIQ banked registers while in FIQ mode
    MOV     R8, #0
    MOV     R9, #0
    MOV     R10, #0
    MOV     R11, #0
    MOV     R12, #0

    # ==================
    # switch the SVC mode and keep all interrupts disabled
    MSR   CPSR_c, #BOOT_FIQ_IRQ_MASK | BOOT_MODE_SVC
    LDR   R0, =stack_base_svc
    MOV   SP, R0

.ifdef CLEAR_BSS
    # Init the BSS section
    LDR     R0, ram_bss_base
    LDR     R1, ram_bss_length
    MOV     R2, #0
    MOV     R3, #0
    MOV     R4, #0
    MOV     R5, #0
init_bss_loop:
    SUBS    R1, R1, #16
    STMCSIA R0!, {R2, R3, R4, R5}
    BHI     init_bss_loop
    MOVS    R1, R1, LSL #29
    STMCSIA R0!, {R4, R5}
    STRMI   R3, [R0]
.endif

    # ==================
    # Clear Registers
    MOV R0, #0
    MOV R1, #0
    MOV R2, #0
    MOV R3, #0
    MOV R4, #0
    MOV R5, #0
    MOV R6, #0
    MOV R7, #0
    MOV R8, #0
    MOV R9, #0
    MOV R10, #0
    MOV R11, #0
    MOV R12, #0

    # call to the main function
    B Main



