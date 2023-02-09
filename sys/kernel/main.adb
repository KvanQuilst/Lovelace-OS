--------------------------------------------------------------------------------
--                                                                            --
-- main.adb - LovelaceOS, Copyright 2023 - Dylan Eksew                        --
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

pragma Style_Checks (off);
pragma Warnings (off);

with Serial; use Serial;

procedure Main is
begin
  Put_Char ('H');
  Put_Char ('E');
  Put_Char ('L');
  Put_Char ('L');
  Put_Char ('O');
  Put_Char (' ');
  Put_Char ('W');
  Put_Char ('O');
  Put_Char ('R');
  Put_Char ('L');
  Put_Char ('D');
  Put_Char ('!');
  Put_Char (Character'Val (10));
end Main;
