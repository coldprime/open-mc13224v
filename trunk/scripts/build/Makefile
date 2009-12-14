# define the build tools
CC=arm-elf-gcc
LD=arm-elf-ld
REG=python ../../tools/reg_xls2h/reg_xls2h.py
LOAD=python ../../tools/loaduart/loaduart.py
LOAD_FLAGS ?= -c 5
BUILDIMAGES=python ../../tools/buildimages/buildimages.py

# register file targets:
## CRM
../../src/build/registers/reg_crm.h: ../../docs/registers/CRM.xls
	mkdir -p $(dir $@)
	$(REG) --short $< "CRM_" 0x80003000 $@
## GPIO
../../src/build/registers/reg_gpio.h: ../../docs/registers/GPIO.xls
	mkdir -p $(dir $@)
	$(REG) --short $< "" 0x80000000 $@
## ITC
../../src/build/registers/reg_itc.h: ../../docs/registers/ITC.xls
	mkdir -p $(dir $@)
	$(REG) --short $< "ITC_" 0x80020000 $@
## SPI
../../src/build/registers/reg_spi.h: ../../docs/registers/SPI.xls
	mkdir -p $(dir $@)
	$(REG) --short $< "SPI_" 0x80002000 $@
## SPIF
../../src/build/registers/reg_spif.h: ../../docs/registers/SPIF.xls
	mkdir -p $(dir $@)
	$(REG) --short $< "SPIF_" 0x8000C000 $@
## UART1
../../src/build/registers/reg_uart1.h: ../../docs/registers/UART.xls
	mkdir -p $(dir $@)
	$(REG) --short $< "UART1_" 0x80005000 $@
## UART2
../../src/build/registers/reg_uart2.h: ../../docs/registers/UART.xls
	mkdir -p $(dir $@)
	$(REG) --short $< "UART2_" 0x8000B000 $@
## TMR0
../../src/build/registers/reg_tmr0.h: ../../docs/registers/TMR.xls
	mkdir -p $(dir $@)
	$(REG) --short $< "TMR0_" 0x80007000 $@
## TMR1
../../src/build/registers/reg_tmr1.h: ../../docs/registers/TMR.xls
	mkdir -p $(dir $@)
	$(REG) --short $< "TMR1_" 0x80007020 $@
## TMR2
../../src/build/registers/reg_tmr2.h: ../../docs/registers/TMR.xls
	mkdir -p $(dir $@)
	$(REG) --short $< "TMR2_" 0x80007040 $@
## TMR3
../../src/build/registers/reg_tmr3.h: ../../docs/registers/TMR.xls
	mkdir -p $(dir $@)
	$(REG) --short $< "TMR3_" 0x80007060 $@

# list of the generated register
register_files= \
	../../src/build/registers/reg_crm.h \
	../../src/build/registers/reg_gpio.h \
	../../src/build/registers/reg_itc.h \
	../../src/build/registers/reg_spi.h \
	../../src/build/registers/reg_spif.h \
	../../src/build/registers/reg_uart1.h \
	../../src/build/registers/reg_uart2.h \
	../../src/build/registers/reg_tmr0.h \
	../../src/build/registers/reg_tmr1.h \
	../../src/build/registers/reg_tmr2.h \
	../../src/build/registers/reg_tmr3.h


# include the specific generation scripts
-include rtos.mk
-include dumpflash_2_0.mk
-include dumpflash_2_1.mk
-include flasher_2_1.mk

.DEFAULT_GOAL=default
.SILENT: default all nuke regs
default:
	echo "No target specified among: "
	echo "all nuke regs $(TARGETS)"

all: $(TARGETS)
	echo "Done building all targets"

nuke:
	rm -rf ../../build
	rm -rf $(register_files)
	echo "Done removing all targets"

regs: $(register_files)
	echo "Done building registers"
	