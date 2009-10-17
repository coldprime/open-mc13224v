../../src/build/registers/reg_crm.h: CRM.xls Makefile 
	mkdir -p $(dir $@)
	python ../../tools/reg_xls2h/reg_xls2h.py --short $< "CRM_" 0x80003000 $@

all: ../../src/build/registers/reg_crm.h 