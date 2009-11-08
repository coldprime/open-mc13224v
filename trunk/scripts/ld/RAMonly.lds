/* configure the output format (default, big, little) */
OUTPUT_FORMAT("elf32-littlearm", "elf32-bigarm", "elf32-littlearm")
/* configure the CPU type */
OUTPUT_ARCH(arm)

/* configure the entry point */
ENTRY(vector_reset)

MEMORY
{
    /* the default Freescale internal SRAM */
    sram (wx) : ORIGIN = 0x400000, LENGTH = 96K
}

/* configure the stack sizes */
stack_len_fiq = 0x100;
stack_len_svc = 0x100;

SECTIONS
{
    EXEC_RAM_VECTORS 0x00400000 :
    {
        /* the address 0 must contain the exception vectors */
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
        sram_heap_bottom = .;
    } > sram
    bss_length = bss_end - bss_base;

    /* SVC STACK */
    RAM_STACK_SVC ORIGIN(sram) + LENGTH(sram) - stack_len_fiq - stack_len_svc (NOLOAD):
    {
        sram_heap_top = .;
        . = stack_len_svc;
        stack_base_svc = .;
    } > sram

    
    /* FIQ STACK */
    RAM_STACK_FIQ ORIGIN(sram) + LENGTH(sram) - stack_len_fiq (NOLOAD):
    {
        . = stack_len_fiq;
        stack_base_fiq = .;
    } > sram
}

/* Definition of the heap area */
heap_bottom = (sram_heap_bottom + 3) & ~ 3;
heap_top = (sram_heap_top) & ~ 3;
