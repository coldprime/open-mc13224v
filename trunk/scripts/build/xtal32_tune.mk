# append the name of the local application to the targets
TARGETS+=xtal32_tune

# local build options
xtal32_tune_CC= -O3 -g3 -Wall -fno-common -msoft-float \
          -mcpu=arm7tdmi-s -march=armv4t -mtune=arm7tdmi-s \
          -std=c99
xtal32_tune_INC= \
	-I ../../src/compiler/gnuarm \
	-I ../../src/build/registers \
	-I ../../src
xtal32_tune_LD= -nostdlib

# list of the objects needed to link xtal32_tune
xtal32_tune_objects= \
	../../build/xtal32_tune/obj/boot/Init-RAMonly.o \
	../../build/xtal32_tune/obj/common/Uart1.o \
	../../build/xtal32_tune/obj/common/Timer.o \
	../../build/xtal32_tune/obj/app/xtal32_tune.o \


../../build/xtal32_tune/obj/%.o: ../../src/%.s $(register_files)
	mkdir -p $(@D)
	$(CC) -c $(xtal32_tune_CC) -o $@ $(xtal32_tune_INC) $<

../../build/xtal32_tune/obj/%.o: ../../src/%.c $(register_files)
	mkdir -p $(@D)
	$(CC) -c $(xtal32_tune_CC) -o $@ $(xtal32_tune_INC) $<

../../build/xtal32_tune/xtal32_tune.elf: $(xtal32_tune_objects)
	$(LD) $(xtal32_tune_LD) -Map $(@:.elf=.map) -o $@ $+ -T ../../scripts/ld/RAMonly.lds

../../build/xtal32_tune/image_flash.bin ../../build/xtal32_tune/image_ram.bin: ../../build/xtal32_tune/xtal32_tune.elf
	@$(BUILDIMAGES) -o $(dir $<)image $<

.PHONY: xtal32_tune xtal32_tune_clean xtal32_tune_install xtal32_tune_flash
.SILENT: xtal32_tune xtal32_tune_clean xtal32_tune_install xtal32_tune_flash
xtal32_tune: ../../build/xtal32_tune/xtal32_tune.elf
	echo "... Finished building xtal32_tune ..."

xtal32_tune_install: ../../build/xtal32_tune/image_ram.bin
	$(LOAD) $(LOAD_FLAGS) $+

xtal32_tune_flash: ../../build/flasher_2_1/image_ram.bin ../../build/xtal32_tune/image_flash.bin
	$(LOAD) $(LOAD_FLAGS) $+

xtal32_tune_clean:
	rm -rf ../../build/xtal32_tune