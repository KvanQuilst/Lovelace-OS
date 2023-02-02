--------------------------------------------------------------------------------
--                                                                            --
-- threads.ads - LovelaceOS, Copyright 2023 - Dylan Eksew                     --
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
with Kernel; use Kernel;

package Threads is

  type Start_Function is access procedure (InitArgs : Unsigned_64);
  type Thread_State is (Idle, Ready, Running, Blocked)
    with Size => 8;

  type Thread_Stack is array (0..SYS_STACK_SIZE-1) of Unsigned_64;

  type Thread is record
    ID           : Unsigned_8;
    State        : Thread_State;
    Thread_Start : Start_Function;
    Init_Args    : Unsigned_64 := 0;
    Stack        : Thread_Stack;
  end record
    with Pack;

  function Init return Thread;

  procedure Yield;
  procedure Sleep;

end Threads;
