/* configure the output format (default, big, little) */
OUTPUT_FORMAT("elf32-littlearm", "elf32-bigarm", "elf32-littlearm")
/* configure the CPU type */
OUTPUT_ARCH(arm)

/* configure the entry point */
ENTRY(vectors)

MEMORY
{
    /* the default Freescale internal SRAM */
    sram (wx) : ORIGIN = 0x400000, LENGTH = 96K
}

/* configure the stack sizes */
stack_len_fiq = 0x3F0;
stack_len_irq = 0x10;
stack_len_svc = 0x3F0;
stack_len_unused = 0x10;

SECTIONS
{
    EXEC_RAM_VECTORS 0x00400000 :
    {
        /* the address 0 must contain the boot vectors */
        *Init-RAMonly.o(.vec)
    } > sram
    
    EXEC_RAM_TEXT 0x00400800 :
    {
        *(.text)
        *(.rodata)
    } > sram

    /* ram data immediately follows the TEXT */
    RAM_DATA :
    {
        *(.data)
    } > sram

    /* BSS section */
    RAM_BSS (NOLOAD):
    {
        bss_base = .;
        *(.bss)
        *(COMMON)
        bss_end = .;
    } > sram
    bss_length = bss_end - bss_base;

    /* UNUSED STACK */
    RAM_STACK_UNUSED ORIGIN(sram) + LENGTH(sram) - stack_len_fiq - stack_len_irq - stack_len_svc - stack_len_unused (NOLOAD):
    {
        stack_base_unused = .;
        . = stack_len_unused;
    } > sram

    /* SVC STACK */
    RAM_STACK_SVC ORIGIN(sram) + LENGTH(sram) - stack_len_fiq - stack_len_irq - stack_len_svc (NOLOAD):
    {
        stack_base_svc = .;
        . = stack_len_svc;
    } > sram

    /* IRQ STACK */
    RAM_STACK_IRQ ORIGIN(sram) + LENGTH(sram) - stack_len_fiq - stack_len_irq (NOLOAD):
    {
        stack_base_irq = .;
        . = stack_len_irq;
    } > sram

    /* FIQ STACK */
    RAM_STACK_FIQ ORIGIN(sram) + LENGTH(sram) - stack_len_fiq (NOLOAD):
    {
        stack_base_fiq = .;
        . = stack_len_fiq;
    } > sram
}
