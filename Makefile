# Makefile for LovelaceOS

# Tool Definitions
GPRBUILD := gprbuild

N_CPUS ?= 1

QEMU 				:= qemu-system-riscv64
QEMU_FLAGS 	:= -machine virt -bios none -m 1G -smp -nographic

