# append the name of the local application to the targets
TARGETS+=rosc_tune

# local build options
rosc_tune_CC= -O3 -g3 -Wall -fno-common -msoft-float \
          -mcpu=arm7tdmi-s -march=armv4t -mtune=arm7tdmi-s \
          -std=c99
rosc_tune_INC= \
	-I ../../src/compiler/gnuarm \
	-I ../../src/build/registers \
	-I ../../src
rosc_tune_LD= -nostdlib

# list of the objects needed to link rosc_tune
rosc_tune_objects= \
	../../build/rosc_tune/obj/boot/Init-RAMonly.o \
	../../build/rosc_tune/obj/common/Uart1.o \
	../../build/rosc_tune/obj/common/Timer.o \
	../../build/rosc_tune/obj/app/rosc_tune.o \


../../build/rosc_tune/obj/%.o: ../../src/%.s $(register_files)
	mkdir -p $(@D)
	$(CC) -c $(rosc_tune_CC) -o $@ $(rosc_tune_INC) $<

../../build/rosc_tune/obj/%.o: ../../src/%.c $(register_files)
	mkdir -p $(@D)
	$(CC) -c $(rosc_tune_CC) -o $@ $(rosc_tune_INC) $<

../../build/rosc_tune/rosc_tune.elf: $(rosc_tune_objects)
	$(LD) $(rosc_tune_LD) -Map $(@:.elf=.map) -o $@ $+ -T ../../scripts/ld/RAMonly.lds

.PHONY: rosc_tune rosc_tune_clean rosc_tune_install rosc_tune_flash
.SILENT: rosc_tune rosc_tune_clean rosc_tune_install rosc_tune_flash
rosc_tune: ../../build/rosc_tune/rosc_tune.elf
	$(BUILDIMAGES) -o $(dir $<)image $<
	echo "... Finished building rosc_tune ..."

rosc_tune_install:
	$(LOAD) $(LOAD_FLAGS) ../../build/rosc_tune/image_ram.bin

rosc_tune_flash:
	$(LOAD) $(LOAD_FLAGS) ../../flasher_2_1/image_ram.bin ../../build/rosc_tune/image_flash.bin

rosc_tune_clean:
	rm -rf ../../build/rosc_tune