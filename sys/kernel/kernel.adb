--------------------------------------------------------------------------------
--                                                                            --
-- kernel.adb - LovelaceOS, Copyright 2023 - Dylan Eksew                      --
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

package body Kernel is

  procedure Start is
    Interrupt_State : Status_Reg;
  begin 

    Interrupt_State := Disable_Interrupts;

    -- Setup Hardware --

    -- Setup idle thread for each hart --
    
    -- Setup trap/interrupt vector --
    
    -- Get a thread and Start --

  end Start;

  procedure OS_Main is
  begin
    null;
  end OS_Main;

end Kernel;
