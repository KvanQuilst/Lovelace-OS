--------------------------------------------------------------------------------
--                                                                            --
-- kernel.ads - LovelaceOS, Copyright 2023 - Dylan Eksew                      --
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
with Interfaces; use Interfaces;

package Kernel is

  ----------------------
  -- Kernel Constants --
  ----------------------
  
  SYS_STACK_SIZE : constant := 1024;
  NUM_THREADS    : constant := 8;


  -----------------------
  -- Kernel Prototypes --
  -----------------------

  procedure Start;
  procedure OS_Main;

end Kernel;
