PROJ = main
CPU ?= cortex-m3
BOARD ?= stm32vldischovery
OBJ = boot.o

.PHONY: all
all: $(PROJ).elf

%.o: %.S
	arm-none-eabi-as -mthumb -mcpu=$(CPU) -g -c $^ -o $@


$(PROJ).elf: $(OBJ)
	arm-none-eabi-ld -Tmap.ld $^ -o $@
	arm-none-eabi-objdump -D -S $@ > $@.lst
	arm-none-eabi-readelf -a $@ > $@.debug


clean:
	rm -rf *.out *.elf .gdb_history *.lst *.debug $(OBJ)
