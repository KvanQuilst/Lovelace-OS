--------------------------------------------------------------------------------
--                                                                            --
-- threads.adb - LovelaceOS, Copyright 2023 - Dylan Eksew                     --
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

package body Threads is

  function Init return Thread is
    T : Thread;
  begin
    return T;
  end Init;


  procedure Yield is
  begin
    null;
  end Yield;


  procedure Sleep is
  begin
    null;
  end Sleep;

end Threads;
