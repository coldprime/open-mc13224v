.section .vec, "ax"
    .align  4
    .global vectors
    .type   vectors, function

vectors:
    # reset handler
    B       boot_reset
    # undefined handler
    B       boot_undefined
    # SWI handler
    B       boot_swi
    # Prefetch error handler
    B       boot_pabort
    # abort handler
    B       boot_dabort
    # reserved vector
    B       boot_reserved
    #  - IRQ
    B       IrqHandler
    #  - FIQ
    B       FiqHandler

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
ram_bss_base:
    .word bss_base

ram_bss_length:
    .word bss_length

#/* ========================================================================
#/**
# * Unused (ABT, UNDEFINED, SYSUSR) Mode
# */
boot_stack_base_UNUSED:
    .word stack_base_unused

boot_stack_len_UNUSED:
    .word stack_len_unused

#/* ========================================================================
#/**
# * IRQ Mode
# */
boot_stack_base_IRQ:
    .word stack_base_irq

boot_stack_len_IRQ:
    .word stack_len_irq


#/* ========================================================================
#/**
# * Supervisor Mode
# */
boot_stack_base_SVC:
    .word stack_base_svc

boot_stack_len_SVC:
    .word stack_len_svc


#/* ========================================================================
#/**
# * FIQ Mode
# */
boot_stack_base_FIQ:
    .word stack_base_fiq

boot_stack_len_FIQ:
    .word stack_len_fiq


#/* ========================================================================
# *                                Functions
# * ========================================================================

#/* ========================================================================
#/**
# * Function to handle reset vector
# */
boot_reset:
    # Disable IRQ and FIQ before starting anything
    MRS   R0, CPSR
    ORR   R0, R0, #0xC0
    MSR   CPSR_c, R0

    # ==================
    # Setup all stacks

    # Note: Sys and Usr mode are not used
    BOOT_CHANGE_MODE SYS
    BOOT_SET_STACK   UNUSED
    BOOT_CHANGE_MODE ABT
    BOOT_SET_STACK   UNUSED
    BOOT_CHANGE_MODE UND
    BOOT_SET_STACK   UNUSED
    BOOT_CHANGE_MODE IRQ
    BOOT_SET_STACK   IRQ
    BOOT_CHANGE_MODE FIQ
    BOOT_SET_STACK   FIQ

    # Clear FIQ banked registers while in FIQ mode
    MOV     R8, #0
    MOV     R9, #0
    MOV     R10, #0
    MOV     R11, #0
    MOV     R12, #0

    BOOT_CHANGE_MODE SVC
    BOOT_SET_STACK   SVC

    # Stay in Supervisor Mode

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

    # call the ROM data init
    BL __rom_data_init

    # call to the main function
    B Main

# undefined handler
boot_undefined:
    B boot_undefined

# SWI handler
boot_swi:
    B boot_swi

# Prefetch error handler
boot_pabort:
    B boot_pabort

# abort handler
boot_dabort:
    B boot_dabort

# reserved vector
boot_reserved:
    B boot_reserved
    SUBS PC, LR, #4


