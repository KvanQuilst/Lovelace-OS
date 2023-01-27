OUTPUT_ARCH( "riscv" )
ENTRY( _entry )

SECTIONS {

  /* start location for qemu -kernel */
  . = 0x80000000;
  .text :
  {
    *(.text)
    .ALIGN(0x1000);
  }

  .rodata :
  {
    *(.rdata)
    *(.rodata)
    *(.rodata.*)
  }

  .data :
  {
    *(.data)
  }

  .bss :
  {
    __bss_start = .
    *(.bss)
    *(.sbss)
    __bss_end = .
  }
  . = ALIGN(0x1000);
}
