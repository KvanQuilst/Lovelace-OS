/******************************************************************************
 *                                                                            *
 * runtime.S - LovelaceOS, Copyright 2023 - Dylan Eksew                       *
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

  .section .data
  .section .text

/* 0x80000000 starting address */
  .global _start
_start:

  /* Zero BSS */
  ld   s1, __bss_start    # s1 := __bss_start
  ld   s2, __bss_end      # s2 := __bss_end
  j    L2
L1: 
  sb   zero, 0(s1)        # (s1) := 0
  addi s1, s1, 8          # s1 := s1 + 8
L2:
  bne  s1, s2, L1         # if s1 != s2, j 1b

  /* Set Stack */
  la   sp, __stack_start  # sp := __stack_start
  
  /* Jump to Ada */
  j _ada_main
