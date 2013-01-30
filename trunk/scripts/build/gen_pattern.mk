# append the name of the local application to the targets
TARGETS+=gen_pattern

# local build options
gen_pattern_CC= -O3 -g3 -Wall -fno-common -msoft-float \
          -mcpu=arm7tdmi-s -march=armv4t -mtune=arm7tdmi-s \
          -std=c99
gen_pattern_INC= \
	-I ../../src/compiler/gnuarm \
	-I ../../src/build/registers \
	-I ../../src
gen_pattern_LD= -nostdlib

# list of the objects needed to link gen_pattern
gen_pattern_objects= \
	../../build/gen_pattern/obj/boot/Init-RAMonly.o \
	../../build/gen_pattern/obj/common/Uart1.o \
	../../build/gen_pattern/obj/common/Timer.o \
	../../build/gen_pattern/obj/app/gen_pattern.o \


../../build/gen_pattern/obj/%.o: ../../src/%.s $(register_files)
	mkdir -p $(@D)
	$(CC) -c $(gen_pattern_CC) -o $@ $(gen_pattern_INC) $<

../../build/gen_pattern/obj/%.o: ../../src/%.c $(register_files)
	mkdir -p $(@D)
	$(CC) -c $(gen_pattern_CC) -o $@ $(gen_pattern_INC) $<

../../build/gen_pattern/gen_pattern.elf: $(gen_pattern_objects)
	$(LD) $(gen_pattern_LD) -Map $(@:.elf=.map) -o $@ $+ -T ../../scripts/ld/RAMonly.lds

../../build/gen_pattern/image_flash.bin ../../build/gen_pattern/image_ram.bin: ../../build/gen_pattern/gen_pattern.elf
	@$(BUILDIMAGES) -o $(dir $<)image $<

.PHONY: gen_pattern gen_pattern_clean gen_pattern_install gen_pattern_flash
.SILENT: gen_pattern gen_pattern_clean gen_pattern_install gen_pattern_flash
gen_pattern: ../../build/gen_pattern/gen_pattern.elf
	echo "... Finished building gen_pattern ..."

gen_pattern_install: ../../build/gen_pattern/image_ram.bin
	$(LOAD) $(LOAD_FLAGS) $+

gen_pattern_flash: ../../build/flasher_2_1/image_ram.bin ../../build/gen_pattern/image_flash.bin
	$(LOAD) $(LOAD_FLAGS) $+

gen_pattern_clean:
	rm -rf ../../build/gen_pattern