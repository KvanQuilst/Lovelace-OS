--------------------------------------------------------------------------------
--                                                                            --
-- ints.ads - LovelaceOS, Copyright 2023 - Dylan Eksew                        --
--                                                                            --
-- LovelaceOS is free software: you can redistribute it and/or modify         --
-- it under the terms of the GNU General Public License as published by       --
-- the Free Software Foundation, either version 3 of the License, or          --
-- (at your option) any later version.                                        --
--                                                                            --
-- LovelaceOS is distributed in the hope that it will be useful,              --
-- but WITHOUT ANY WARRANTY; without even the implied warranty of             --
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the              --
-- GNU General Public License for more details.                               --
--                                                                            --
-- You should have received a copy of the GNU General Public License          --
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.      --
--                                                                            --
--------------------------------------------------------------------------------

package Ints is

  type Bit is mod 2**1
    with Size => 1;
  type Unsigned_2 is mod 2**2
    with Size => 2;

  type Unsigned_9 is mod 2**9
    with Size => 9;

  type Unsigned_25 is mod 2**25
    with Size => 25;

  

end Ints;
