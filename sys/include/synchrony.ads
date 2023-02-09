--------------------------------------------------------------------------------
--                                                                            --
-- synchrony.ads - LovelaceOS, Copyright 2023 - Dylan Eksew                   --
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
with Interfaces.Lovelace; use Interfaces.Lovelace;
with List;
with Threads; use Threads;

package Synchrony is
  package Thread_List is new 
    List (Thread, Thread_Acc); use Thread_List;

  type Semaphore is limited private;

  type Mutex     is limited private;

  --------------------------
  -- Semaphore Prototypes --
  --------------------------
  
  function Semaphore_Init  (Init_Val : UInt64) return access Semaphore;
  procedure Semaphore_Up   (S : access Semaphore);
  procedure Semaphore_Down (S : access Semaphore);

  ----------------------
  -- Mutex Prototypes --
  ----------------------

  procedure Mutex_Lock   (M : access Mutex);
  procedure Mutex_Unlock (M : access Mutex);

private

  type Semaphore is record
    Count     : UInt64;
    Wait_List : Thread_List.List;
  end record;

  type Mutex is record
    Held_By   : Thread_Acc; 
    Wait_List : Thread_List.List;
  end record;

end Synchrony;
