# define the register generation tool
REG = python ../../tools/reg_xls2h/reg_xls2h.py

../../src/build/registers/reg_gpio.h: GPIO.xls Makefile 
	mkdir -p $(dir $@)
	$(REG) --short $< "" 0x80000000 $@

../../src/build/registers/reg_spi.h: SPI.xls Makefile 
	mkdir -p $(dir $@)
	$(REG) --short $< "SPI_" 0x80002000 $@

../../src/build/registers/reg_crm.h: CRM.xls Makefile 
	mkdir -p $(dir $@)
	$(REG) --short $< "CRM_" 0x80003000 $@

../../src/build/registers/reg_uart1.h: UART.xls Makefile 
	mkdir -p $(dir $@)
	$(REG) --short $< "UART1_" 0x80005000 $@

../../src/build/registers/reg_uart2.h: UART.xls Makefile 
	mkdir -p $(dir $@)
	$(REG) --short $< "UART2_" 0x8000B000 $@

../../src/build/registers/reg_spif.h: SPIF.xls Makefile 
	mkdir -p $(dir $@)
	$(REG) --short $< "SPIF_" 0x8000C000 $@

../../src/build/registers/reg_itc.h: ITC.xls Makefile 
	mkdir -p $(dir $@)
	$(REG) --short $< "ITC_" 0x80020000 $@


all: ../../src/build/registers/reg_gpio.h ../../src/build/registers/reg_spi.h \
	../../src/build/registers/reg_crm.h ../../src/build/registers/reg_uart1.h  \
	../../src/build/registers/reg_uart2.h ../../src/build/registers/reg_spif.h \
	../../src/build/registers/reg_itc.h 