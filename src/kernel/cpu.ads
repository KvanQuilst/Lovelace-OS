--------------------------------------------------------------------------------
--                                                                            --
-- cpu.ads - LovelaceOS, Copyright 2023 - Dylan Eksew                         --
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
with Ints; use Ints;

package CPU is

  ------------------------------
  -- mstatus/sstatus Register --
  ------------------------------

  type Status_Reg (Raw : Boolean := True) is record
    case Raw is
      when True => 
        Status     : Unsigned_64;
      when False =>
        WPRI_0_0   : Bit;
        SIE        : Bit;         -- Supervisor Interrupt Enable
        WPRI_2_2   : Bit;         
        MIE        : Bit;         -- Machine Interrupt Enable
        WPRI_4_4   : Bit;         
        SPIE       : Bit;         -- 
        UBE        : Bit;         --
        MPIE       : Bit;         --
        SPP        : Bit;         --
        VS         : Unsigned_2;  --
        MPP        : Unsigned_2;  --
        FS         : Unsigned_2;  --
        XS         : Unsigned_2;  --
        MPRV       : Bit;         --
        SUM        : Bit;         --
        MXR        : Bit;         --
        TVM        : Bit;         --
        TW         : Bit;         --
        TSR        : Bit;         --
        WPRI_23_31 : Unsigned_9; 
        UXL        : Unsigned_2;  --
        SXL        : Unsigned_2;  --
        SBE        : Bit;         --
        MBE        : Bit;         --
        WPRI_38_62 : Unsigned_25; 
        SD         : Bit;         --
    end case;
  end record
    with Unchecked_Union;

  for Status_Reg use record
    Status      at 0 range 0..63;
    WPRI_0_0    at 0 range 0..0;
    SIE         at 0 range 1..1;
    WPRI_2_2    at 0 range 2..2;
    MIE         at 0 range 3..3;
    WPRI_4_4    at 0 range 4..4;
    SPIE        at 0 range 5..5;
    UBE         at 0 range 6..6;
    MPIE        at 0 range 7..7;
    SPP         at 0 range 8..8;
    VS          at 0 range 9..10;
    MPP         at 0 range 11..12;
    FS          at 0 range 13..14;
    XS          at 0 range 15..16;
    MPRV        at 0 range 17..17;
    SUM         at 0 range 18..18;
    MXR         at 0 range 19..19;
    TVM         at 0 range 20..20;
    TW          at 0 range 21..21;
    TSR         at 0 range 22..22;
    WPRI_23_31 at 0 range 23..31;
    UXL        at 0 range 32..33;
    SXL        at 0 range 34..35;
    SBE        at 0 range 36..36;
    MBE        at 0 range 37..37;
    WPRI_38_62 at 0 range 38..62;
    SD         at 0 range 63..63;
  end record;

  ----------------
  -- Prototypes --
  ----------------

  function Disable_Interrupts return Status_Reg;
  procedure Enable_Interrupts;
  procedure Restore_Interrupts (State : Status_Reg);

end CPU;
