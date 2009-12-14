# append the name of the local application to the targets
TARGETS+=dumpflash_2_0

# local build options
dumpflash_2_0_CC= -O3 -g3 -Wall -c -fno-strict-aliasing  -fno-common -ffixed-r8 -msoft-float \
          -mcpu=arm7tdmi-s -mtune=arm7tdmi-s -march=armv4t \
          -mthumb -mthumb-interwork -mcallee-super-interworking 
dumpflash_2_0_INC= \
	-I ../../src/interface/ROM_2_0 \
	-I ../../src/common \
	-I ../../src/build/registers \
	-I ../../src/compiler/gnuarm \
	-I ../../src
dumpflash_2_0_LD= -nostartfiles -nostdlib -static
dumpflash_2_0_LIBS=../../libraries/LLC_2_0.a

# list of the objects needed to link dumpflash_2_0
dumpflash_2_0_objects= \
	../../build/dumpflash_2_0/obj/boot/Init-RAMROM.o \
	../../build/dumpflash_2_0/obj/common/Uart1.o \
	../../build/dumpflash_2_0/obj/common/Flash.o \
	../../build/dumpflash_2_0/obj/app/dumpflash.o

../../build/dumpflash_2_0/obj/%.o: ../../src/%.s $(register_files)
	mkdir -p $(@D)
	$(CC) -c $(dumpflash_2_0_CC) -o $@ $(dumpflash_2_0_INC) $<

../../build/dumpflash_2_0/obj/%.o: ../../src/%.c $(register_files)
	mkdir -p $(@D)
	$(CC) -c $(dumpflash_2_0_CC) -o $@ $(dumpflash_2_0_INC) $<


../../build/dumpflash_2_0/dumpflash_2_0.elf: $(dumpflash_2_0_objects)
	$(LD) $(dumpflash_2_0_LD) -Map $(@:.elf=.map) -o $@ $+ $(dumpflash_2_0_LIBS) -T ../../scripts/ld/RAMROM.lds

.PHONY: dumpflash_2_0 dumpflash_2_0_clean dumpflash_2_0_install dumpflash_2_0_flash
.SILENT: dumpflash_2_0 dumpflash_2_0_clean dumpflash_2_0_install dumpflash_2_0_flash
dumpflash_2_0: ../../build/dumpflash_2_0/dumpflash_2_0.elf
	$(BUILDIMAGES) -o $(dir $<)image $<
	echo "... Finished building dumpflash_2_0 ..."

dumpflash_2_0_install:
	$(LOAD) $(LOAD_FLAGS) -b 230400 ../../build/dumpflash_2_0/image_ram.bin

dumpflash_2_0_flash:
	$(LOAD) $(LOAD_FLAGS) -b 230400 ../../flasher_2_1/image_ram.bin ../../build/dumpflash_2_0/image_flash.bin

dumpflash_2_0_clean:
	rm -rf ../../build/dumpflash_2_0