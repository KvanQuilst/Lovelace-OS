--------------------------------------------------------------------------------
--                                                                            --
-- list.adb - LovelaceOS, Copyright 2023 - Dylan Eksew                        --
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

package body List is

  function Is_Empty (L : in List) return Boolean is
  begin
    return L.Head = null;
  end Is_Empty;

  procedure Add_To_Front (L : in out List; Value : in T) is
    N : List_Node_Acc;
  begin
    N := new List_Node'(Value, L.Head);
    L.Head := N;    
    L.Length := L.Length + 1;
  end Add_To_Front;

  procedure Add_To_End (L : in out List; Value : in T) is
    N : List_Node_Acc;
  begin
    N := new List_Node'(Value, null);
    L.Tail.Next := N;
    L.Tail := N;
    L.Length := L.Length + 1;
  end Add_To_End;

  function Remove (L : in out List) return T is
    Value : T;
  begin
    Value := L.Head.Value; 
    L.Head := L.Head.Next;
    L.Length := L.Length - 1;
    return Value;
  end Remove;

end List;
