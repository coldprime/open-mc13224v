# define the build tools
CC=arm-elf-gcc
LD=arm-elf-ld
REG = python ../../tools/reg_xls2h/reg_xls2h.py

# build tool options
CC_FLAGS= -O3 -g3 -Wall -fno-common -msoft-float \
          -mcpu=arm7tdmi-s -march=armv4t -mtune=arm7tdmi-s
LD_FLAGS= -nostdlib

CC_INC= \
	-I ../../src/compiler/gnuarm \
	-I ../../src/build/registers \
	-I ../../src/rtos \
	-I ../../src/common

# default target
default: rtos install


../../src/build/registers/reg_crm.h: ../../docs/registers/CRM.xls
	mkdir -p $(dir $@)
	$(REG) --short $< "CRM_" 0x80003000 $@

../../src/build/registers/reg_gpio.h: ../../docs/registers/GPIO.xls
	mkdir -p $(dir $@)
	$(REG) --short $< "" 0x80000000 $@

../../src/build/registers/reg_itc.h: ../../docs/registers/ITC.xls
	mkdir -p $(dir $@)
	$(REG) --short $< "ITC_" 0x80020000 $@

../../src/build/registers/reg_spi.h: ../../docs/registers/SPI.xls
	mkdir -p $(dir $@)
	$(REG) --short $< "SPI_" 0x80002000 $@

../../src/build/registers/reg_spif.h: ../../docs/registers/SPIF.xls
	mkdir -p $(dir $@)
	$(REG) --short $< "SPIF_" 0x8000C000 $@

../../src/build/registers/reg_uart1.h: ../../docs/registers/UART.xls
	mkdir -p $(dir $@)
	$(REG) --short $< "UART1_" 0x80005000 $@

../../src/build/registers/reg_uart2.h: ../../docs/registers/UART.xls
	mkdir -p $(dir $@)
	$(REG) --short $< "UART2_" 0x8000B000 $@

# list of the objects needed to link RTOS
rtos_objects= \
	../../build/rtos/obj/boot/Init-RAMonly.o \
	../../build/rtos/obj/common/Uart1.o \
	../../build/rtos/obj/rtos/rtos_asm.o \
	../../build/rtos/obj/rtos/rtos.o \
	../../build/rtos/obj/app/rtos_test.o

# list of the generated register
register_files= \
	../../src/build/registers/reg_crm.h \
	../../src/build/registers/reg_gpio.h \
	../../src/build/registers/reg_itc.h \
	../../src/build/registers/reg_spi.h \
	../../src/build/registers/reg_spif.h \
	../../src/build/registers/reg_uart1.h \
	../../src/build/registers/reg_uart2.h

../../build/rtos/obj/%.o: ../../src/%.s $(register_files)
	mkdir -p $(@D)
	$(CC) -c $(CC_FLAGS) -o $@ $(CC_INC) $<

../../build/rtos/obj/%.o: ../../src/%.c $(register_files)
	mkdir -p $(@D)
	$(CC) -c $(CC_FLAGS) -o $@ $(CC_INC) $<


../../build/rtos/rtos.elf: $(rtos_objects)
	$(LD) $(LD_FLAGS) -o $@ $(rtos_objects) -T ../../scripts/ld/RAMonly.lds

.PHONY: rtos clean install
.SILENT: rtos clean install
rtos: ../../build/rtos/rtos.elf
	python ../../tools/buildimages/buildimages.py -o ../../build/rtos/image $<
	echo "... Finished building RTOS ..."

LOADUART ?= -c 5

install:
	python ../../tools/loaduart/loaduart.py $(LOADUART) -b 230400 ../../build/rtos/image_ram.bin

flash:
	python ../../tools/loaduart/loaduart.py $(LOADUART) -b 230400 ../../flasher_2_1/image_ram.bin ../../build/rtos/image_flash.bin

clean:
	rm -rf ../../build/rtos