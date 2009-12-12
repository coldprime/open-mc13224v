# append the name of the local application to the targets
TARGETS+=dumpflash_2_1

# local build options
DUMPFLASH_2_1_CC= -O3 -g3 -Wall -c -fno-strict-aliasing  -fno-common -ffixed-r8 -msoft-float \
          -mcpu=arm7tdmi-s -mtune=arm7tdmi-s -march=armv4t \
          -mthumb -mthumb-interwork -mcallee-super-interworking 
DUMPFLASH_2_1_INC= \
	-I ../../src/interface/ROM_2_1 \
	-I ../../src/common \
	-I ../../src/build/registers \
	-I ../../src/compiler/gnuarm \
	-I ../../src
DUMPFLASH_2_1_LD= -nostartfiles -nostdlib -static
DUMPFLASH_2_1_LIBS=../../libraries/LLC_2_1.a

# list of the objects needed to link dumpflash_2_1
dumpflash_2_1_objects= \
	../../build/dumpflash_2_1/obj/boot/Init-RAMROM.o \
	../../build/dumpflash_2_1/obj/common/Uart1.o \
	../../build/dumpflash_2_1/obj/common/Flash.o \
	../../build/dumpflash_2_1/obj/app/dumpflash.o

../../build/dumpflash_2_1/obj/%.o: ../../src/%.s $(register_files)
	mkdir -p $(@D)
	$(CC) -c $(DUMPFLASH_2_1_CC) -o $@ $(DUMPFLASH_2_1_INC) $<

../../build/dumpflash_2_1/obj/%.o: ../../src/%.c $(register_files)
	mkdir -p $(@D)
	$(CC) -c $(DUMPFLASH_2_1_CC) -o $@ $(DUMPFLASH_2_1_INC) $<


../../build/dumpflash_2_1/dumpflash_2_1.elf: $(dumpflash_2_1_objects)
	$(LD) $(DUMPFLASH_2_1_LD) -Map $(@:.elf=.map) -o $@ $? $(DUMPFLASH_2_1_LIBS) -T ../../scripts/ld/RAMROM.lds

.PHONY: dumpflash_2_1 dumpflash_2_1_clean dumpflash_2_1_install dumpflash_2_1_flash
.SILENT: dumpflash_2_1 dumpflash_2_1_clean dumpflash_2_1_install dumpflash_2_1_flash
dumpflash_2_1: ../../build/dumpflash_2_1/dumpflash_2_1.elf
	$(BUILDIMAGES) -o $(dir $<)image $<
	echo "... Finished building dumpflash_2_1 ..."

dumpflash_2_1_install:
	$(LOAD) $(LOAD_FLAGS) -b 230400 ../../build/dumpflash_2_1/image_ram.bin

dumpflash_2_1_flash:
	$(LOAD) $(LOAD_FLAGS) -b 230400 ../../flasher_2_1/image_ram.bin ../../build/dumpflash_2_1/image_flash.bin

dumpflash_2_1_clean:
	rm -rf ../../build/dumpflash_2_1