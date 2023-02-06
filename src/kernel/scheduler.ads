--------------------------------------------------------------------------------
--                                                                            --
-- scheduler.ads - LovelaceOS, Copyright 2023 - Dylan Eksew                   --
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
with List;
with Threads; use Threads;

package Scheduler is
  package Thread_List is new List (Thread, Thread_Acc); use Thread_List;

  procedure Idle;
  function Current_Thread return Thread_Acc;

private

  Ready_List : Thread_List.List;

end Scheduler;
