/******************************************************************************
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
 ******************************************************************************/

  .section .data
  .section .text

/* 0x80000000 starting address */
  .global _entry
_entry:
  li s1, 0x10000000 # s1 := 0x10000000
  li s2, 0x48       # s2 := 'H'
  sb s2, 0(s1)      # (s1) := s2
