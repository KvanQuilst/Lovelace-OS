--------------------------------------------------------------------------------
--                                                                            --
-- synchrony.adb - LovelaceOS, Copyright 2023 - Dylan Eksew                   --
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
with CPU; use CPU;
with Interfaces.Lovelace; use Interfaces.Lovelace;
with Scheduler;

package body Synchrony is

  function Semaphore_Init (Init_Val : UInt64) return access Semaphore is
    S : access Semaphore;
  begin
    return null;
  end Semaphore_Init;


  procedure Semaphore_Up (S : access Semaphore) is
  begin
    null;
  end Semaphore_Up;

  procedure Semaphore_Down (S : access Semaphore) is
  begin
    null;
  end Semaphore_Down;


  procedure Mutex_Lock (M : access Mutex) is
    Curr_T : Thread_Acc;
    Old_Ints : Status_Reg;
  begin
    Old_Ints := Disable_Interrupts;

    Curr_T := Scheduler.Current_Thread;
    if Curr_T = M.Held_By then
      Panic ("Mutex: Lock already held by this thread!");
    end if;

    if M.Held_By /= null then
      Add_To_End (M.Wait_List, Curr_T); 
      Sleep (Curr_T);
    else
      M.Held_By := Curr_T;
    end if;

    Restore_Interrupts (Old_Ints);
  end Mutex_Lock;

  procedure Mutex_Unlock (M : access Mutex) is
    Curr_T, Next : Thread_Acc;
    Old_Ints : Status_Reg;
  begin
    Old_Ints := Disable_Interrupts;

    Curr_T := Scheduler.Current_Thread;
    if Curr_T /= M.Held_By then
      Panic ("Mutex: Held thread is different from current thread for unlock!");
    end if;

    Next := Remove (M.Wait_List);
    if Next /= null then
      Run (Next);
      M.Held_By := Next;
    else
      M.Held_By := null;
    end if;
        
    Restore_Interrupts (Old_Ints);
  end Mutex_Unlock;

end Synchrony;
