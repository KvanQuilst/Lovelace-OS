--------------------------------------------------------------------------------
--                                                                            --
-- cpu.adb - LovelaceOS, Copyright 2023 - Dylan Eksew                         --
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
with System.Machine_Code; use System.Machine_Code;

package body CPU is

  ------------------------
  -- Assembly Functions --
  ------------------------

  function Get_MStatus return Status_Reg is
    Interrupt_State : Status_Reg;
  begin
    Asm ("csrr %0, mstatus", 
         Outputs => UInt64'Asm_Output ("=g", Interrupt_State.Status),
         Volatile => True);
    return Interrupt_State;
  end Get_MStatus;

  procedure Put_MStatus (Interrupt_State : Status_Reg) is
  begin
    Asm ("csrw mstatus, %0",
         Inputs => UInt64'Asm_Input ("g", Interrupt_State.Status),
         Volatile => True);
  end Put_MStatus;

  
  ---------------------------
  -- Public CPU Management --
  ---------------------------
  
  function Disable_Interrupts return Status_Reg is
    Interrupt_State, Old_State : Status_Reg;
  begin
    Interrupt_State := Get_MStatus;
    Old_State := Interrupt_State;
    Interrupt_State.MIE := 0;
    Put_MStatus(Interrupt_State);
    return Old_State;
  end Disable_Interrupts;

  procedure Enable_Interrupts is
    Interrupt_State : Status_Reg;
  begin
    Interrupt_State := Get_MStatus;
    Interrupt_State.MIE := 1;
    Put_MStatus(Interrupt_State);
  end Enable_Interrupts;

  procedure Restore_Interrupts (State : Status_Reg) is
    Interrupt_State : Status_Reg;
  begin
    Interrupt_State := Get_MStatus;
    Interrupt_State.MIE := State.MIE;
    Put_MStatus(Interrupt_State);
  end Restore_Interrupts;


  procedure Panic (Mesg : String) is
    Ints : Status_Reg;
  begin
    Ints := Disable_Interrupts;
    -- TODO Print error and kernel details
    loop
      null;
    end loop;
  end Panic;

end CPU;
