# Lovelace-OS
An operating system written in Ada. Currently targets the following architectures:
  - RISC-V RV64IMAFDC, qemu virt

## Building

Requirements:
  - [GNAT Community Tools - RISC-V ELF 64bit](https://www.adacore.com/download/more)
      - Inlcudes gprbuild tools, gcc/gnat/ binutils, gdb
  - [qemu for RISCV 64bit](https://github.com/qemu/qemu)
  - Make
  
Compile:
  `make build`
