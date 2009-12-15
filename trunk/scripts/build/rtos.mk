# append the name of the local application to the targets
TARGETS+=rtos

# local build options
rtos_CC= -O3 -g3 -Wall -fno-common -msoft-float \
          -mcpu=arm7tdmi-s -march=armv4t -mtune=arm7tdmi-s \
          -std=c99
rtos_INC= \
	-I ../../src/compiler/gnuarm \
	-I ../../src/build/registers \
	-I ../../src
rtos_LD= -nostdlib

# list of the objects needed to link rtos
ifneq ($(AC), 1)
rtos_objects= \
	../../build/rtos/obj/boot/Init-RAMonly.o \
	../../build/rtos/obj/common/Uart1.o \
	../../build/rtos/obj/common/Timer.o \
	../../build/rtos/obj/rtos/rtos_asm.o \
	../../build/rtos/obj/rtos/rtos.o \
	../../build/rtos/obj/app/rtos_test.o
else
rtos_objects= \
	../../build/rtos/obj/boot/Init-RAMonly.o \
	../../build/rtos/obj/common/Uart1.o \
	../../build/rtos/obj/rtos_ac/switch.o \
	../../build/rtos/obj/rtos_ac/rtos_ac.o \
	../../build/rtos/obj/rtos_ac/test.o

endif

../../build/rtos/obj/%.o: ../../src/%.s $(register_files)
	mkdir -p $(@D)
	$(CC) -c $(rtos_CC) -o $@ $(rtos_INC) $<

../../build/rtos/obj/%.o: ../../src/%.c $(register_files)
	mkdir -p $(@D)
	$(CC) -c $(rtos_CC) -o $@ $(rtos_INC) $<

../../build/rtos/rtos.elf: $(rtos_objects)
	$(LD) $(rtos_LD) -Map $(@:.elf=.map) -o $@ $+ -T ../../scripts/ld/RAMonly.lds

.PHONY: rtos rtos_clean rtos_install rtos_flash
.SILENT: rtos rtos_clean rtos_install rtos_flash
rtos: ../../build/rtos/rtos.elf
	$(BUILDIMAGES) -o $(dir $<)image $<
	echo "... Finished building rtos ..."

rtos_install:
	$(LOAD) $(LOAD_FLAGS) ../../build/rtos/image_ram.bin

rtos_flash:
	$(LOAD) $(LOAD_FLAGS) ../../flasher_2_1/image_ram.bin ../../build/rtos/image_flash.bin

rtos_clean:
	rm -rf ../../build/rtos