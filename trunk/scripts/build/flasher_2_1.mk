# append the name of the local application to the targets
TARGETS+=flasher_2_1

# local build options
FLASH_2_1_CC= -O3 -g3 -Wall -c -fno-strict-aliasing  -fno-common -ffixed-r8 -msoft-float \
          -mcpu=arm7tdmi-s -mtune=arm7tdmi-s -march=armv4t \
          -mthumb -mthumb-interwork -mcallee-super-interworking 
FLASH_2_1_INC= \
	-I ../../src/interface/ROM_2_1 \
	-I ../../src/common \
	-I ../../src/build/registers \
	-I ../../src/compiler/gnuarm \
	-I ../../src
FLASH_2_1_LD= -nostartfiles -nostdlib -static
FLASH_2_1_LIBS=../../libraries/LLC_2_1.a

# list of the objects needed to link flasher_2_1
flasher_2_1_objects= \
	../../build/flasher_2_1/obj/boot/Init-RAMROM.o \
	../../build/flasher_2_1/obj/common/Uart1.o \
	../../build/flasher_2_1/obj/common/Flash.o \
	../../build/flasher_2_1/obj/app/flasher.o

../../build/flasher_2_1/obj/%.o: ../../src/%.s $(register_files)
	mkdir -p $(@D)
	$(CC) -c $(FLASH_2_1_CC) -o $@ $(FLASH_2_1_INC) $<

../../build/flasher_2_1/obj/%.o: ../../src/%.c $(register_files)
	mkdir -p $(@D)
	$(CC) -c $(FLASH_2_1_CC) -o $@ $(FLASH_2_1_INC) $<


../../build/flasher_2_1/flasher_2_1.elf: $(flasher_2_1_objects)
	$(LD) $(FLASH_2_1_LD) -Map $(@:.elf=.map) -o $@ $? $(FLASH_2_1_LIBS) -T ../../scripts/ld/RAMROM.lds

.PHONY: flasher_2_1 flasher_2_1_clean flasher_2_1_install flasher_2_1_flash
.SILENT: flasher_2_1 flasher_2_1_clean flasher_2_1_install flasher_2_1_flash
flasher_2_1: ../../build/flasher_2_1/flasher_2_1.elf
	$(BUILDIMAGES) -o $(dir $<)image $<
	echo "... Finished building flasher_2_1 ..."

flasher_2_1_install:
	$(LOAD) $(LOAD_FLAGS) -b 230400 ../../build/flasher_2_1/image_ram.bin

flasher_2_1_flash:
	$(LOAD) $(LOAD_FLAGS) -b 230400 ../../flasher_2_1/image_ram.bin ../../build/flasher_2_1/image_flash.bin

flasher_2_1_clean:
	rm -rf ../../build/flasher_2_1