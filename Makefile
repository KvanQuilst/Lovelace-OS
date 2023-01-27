#******************************************************************************
#* Makefile - LovelaceOS, Copyright 2023 - Dylan Eksew                        *
#*                                                                            *
#* LovelaceOS is free software: you can redistribute it and/or modify         *
#* it under the terms of the GNU General Public License as published by       *
#* the Free Software Foundation, either version 3 of the License, or          *
#* (at your option) any later version.                                        *
#*                                                                            *
#* LovelaceOS is distributed in the hope that it will be useful,              *
#* but WITHOUT ANY WARRANTY; without even the implied warranty of             *
#* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the              *
#* GNU General Public License for more details.                               *
#*                                                                            *
#* You should have received a copy of the GNU General Public License          *
#* along with this program.  If not, see <http://www.gnu.org/licenses/>.      *
#******************************************************************************

# Makefile for LovelaceOS

OS_NAME := lovelace

OBJ_DIR := obj

# Tool Definitions
PREFIX   := riscv64-elf
GPRBUILD := gprbuild

N_CPUS ?= 1

QEMU 				:= qemu-system-riscv64
QEMU_FLAGS 	:= -kernel ${OS_NAME} -machine virt -bios none -m 1G -smp 1 -nographic

GDB := ${PREFIX}-gdb

.PHONY: help
help:
	@echo "Makefile - LovelaceOS, Copyright 2023 - Dylan Eskew"
	@echo "usage: make [help|build|run|debug|clean]"
	@echo ""
	@echo " help"
	@echo "   Print this message."
	@echo ""
	@echo " build"
	@echo "   Build LovelaceOS for riscv64imafdc."
	@echo ""
	@echo " run"
	@echo "   Run ${QEMU} emulator using ${OS_NAME} as the kernel."
	@echo "   Equivalent: ${QEMU} ${QEMU_FLAGS}"
	@echo ""
	@echo " debug"
	@echo "   Run ${QEMU} emulator using ${OS_NAME} as the kernel with debug"
	@echo "     mode enabled. Attach ${GDB} to with"
	@echo "     	(gdb) target remote localhost:1234"
	@echo "     to start debugging."
	@echo ""
	@echo " clean"
	@echo "   Clean the build files in ${OBJ_DIR}/"

.PHONY: build
build: 
	gprbuild -P ${OS_NAME}.gpr -o lovelace --config=riscv64-elf.cgpr

.PHONY: run
run:
	${QEMU} ${QEMU_FLAGS} 

.PHONY: debug
debug:
	${QEMU} ${QEMU_FLAGS} -s -S

.PHONY: clean
clean:
	gprclean -P ${OS_NAME}.gpr
