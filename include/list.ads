--------------------------------------------------------------------------------
--                                                                            --
-- list.ads - LovelaceOS, Copyright 2023 - Dylan Eksew                        --
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

generic 
  type T is private;
  type T_Acc is access T;
package List is

  type List is limited private;

  function  Is_Empty     (L : in     List) return Boolean;
  procedure Add_To_Front (L : in out List; Value : in T_Acc);
  procedure Add_To_End   (L : in out List; Value : in T_Acc);
  function  Remove       (L : in out List) return T_Acc;

private

  type List_Node;
  type List_Node_Acc is access List_Node;

  type List_Node is record
    Value : T_Acc;
    Next : List_Node_Acc; 
  end record;

  type List is record
    Head   : List_Node_Acc;
    Tail   : List_Node_Acc;
    Length : Integer;
  end record;

end List;
