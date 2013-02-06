# append the name of the local application to the targets
TARGETS+=delay_vsync

# local build options
delay_vsync_CC= -O3 -g3 -Wall -fno-common -msoft-float \
          -mcpu=arm7tdmi-s -march=armv4t -mtune=arm7tdmi-s \
          -std=c99
delay_vsync_INC= \
	-I ../../src/compiler/gnuarm \
	-I ../../src/build/registers \
	-I ../../src
delay_vsync_LD= -nostdlib

# list of the objects needed to link delay_vsync
delay_vsync_objects= \
	../../build/delay_vsync/obj/boot/Init-RAMonly.o \
	../../build/delay_vsync/obj/common/Uart1.o \
	../../build/delay_vsync/obj/common/Timer.o \
	../../build/delay_vsync/obj/app/delay_vsync.o \


../../build/delay_vsync/obj/%.o: ../../src/%.s $(register_files)
	mkdir -p $(@D)
	$(CC) -c $(delay_vsync_CC) -o $@ $(delay_vsync_INC) $<

../../build/delay_vsync/obj/%.o: ../../src/%.c $(register_files)
	mkdir -p $(@D)
	$(CC) -c $(delay_vsync_CC) -o $@ $(delay_vsync_INC) $<

../../build/delay_vsync/delay_vsync.elf: $(delay_vsync_objects)
	$(LD) $(delay_vsync_LD) -Map $(@:.elf=.map) -o $@ $+ -T ../../scripts/ld/RAMonly.lds

../../build/delay_vsync/image_flash.bin ../../build/delay_vsync/image_ram.bin: ../../build/delay_vsync/delay_vsync.elf
	@$(BUILDIMAGES) -o $(dir $<)image $<

.PHONY: delay_vsync delay_vsync_clean delay_vsync_install delay_vsync_flash
.SILENT: delay_vsync delay_vsync_clean delay_vsync_install delay_vsync_flash
delay_vsync: ../../build/delay_vsync/delay_vsync.elf
	echo "... Finished building delay_vsync ..."

delay_vsync_install: ../../build/delay_vsync/image_ram.bin
	$(LOAD) $(LOAD_FLAGS) $+

delay_vsync_flash: ../../build/flasher_2_1/image_ram.bin ../../build/delay_vsync/image_flash.bin
	$(LOAD) $(LOAD_FLAGS) $+

delay_vsync_clean:
	rm -rf ../../build/delay_vsync