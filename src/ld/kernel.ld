/******************************************************************************
 *                                                                            *
 * kernel.ld - LovelaceOS, Copyright 2023 - Dylan Eksew                       *
 *                                                                            *
 * LovelaceOS is free software: you can redistribute it and/or modify         *
 * it under the terms of the GNU General Public License as published by       *
 * the Free Software Foundation, either version 3 of the License, or          *
 * (at your option) any later version.                                        *
 *                                                                            *
 * LovelaceOS is distributed in the hope that it will be useful,              *
 * but WITHOUT ANY WARRANTY; without even the implied warranty of             *
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the              *
 * GNU General Public License for more details.                               *
 *                                                                            *
 * You should have received a copy of the GNU General Public License          *
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.      *
 *                                                                            *
 ******************************************************************************/

OUTPUT_ARCH( "riscv" )
ENTRY( _start )

SECTIONS {

  /* start location for qemu -kernel */
  . = 0x80000000;
  .text :
  {
    *(.text)
    . = ALIGN(0x8);
  }
  . = ALIGN(0x8);

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
    __bss_start = .;
    *(.bss)
    *(.sbss)
    __bss_end = .;
  }
  . = ALIGN(0x8);
}

PROVIDE(__stack_start = __bss_end);
PROVIDE(__stack_end = __stack_start + 0x8000);
