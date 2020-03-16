--------------------------------------------------------------------------------
-- Copyright (c) 1995-2010 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: M.81d
--  \   \         Application: netgen
--  /   /         Filename: Tdc.vhd
-- /___/   /\     Timestamp: Fri May 10 18:27:40 2013
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -ofmt vhdl -w Tdc.ngc 
-- Device	: xc5vsx95t-1-ff1136
-- Input file	: Tdc.ngc
-- Output file	: Tdc.vhd
-- # of Entities	: 3
-- Design Name	: Tdc
-- Xilinx	: C:\NIFPGA\programs\Xilinx12_4\ISE\
--             
-- Purpose:    
--     This VHDL netlist is a verification model and uses simulation 
--     primitives which may not represent the true implementation of the 
--     device, however the netlist is functionally correct and should not 
--     be modified. This file cannot be synthesized and should only be used 
--     with supported simulation tools.
--             
-- Reference:  
--     Command Line Tools User Guide, Chapter 23
--     Synthesis and Simulation Design Guide, Chapter 6
--             
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
use UNISIM.VPKG.ALL;

entity HandshakeBase is
  port (
    OClk : in STD_LOGIC := 'X'; 
    IClk : in STD_LOGIC := 'X'; 
    iStoredData : out STD_LOGIC_VECTOR ( 10 downto 0 ); 
    oDataValid : out STD_LOGIC_VECTOR ( 0 downto 0 ); 
    oData : out STD_LOGIC_VECTOR ( 10 downto 0 ); 
    iReady : out STD_LOGIC_VECTOR ( 0 downto 0 ); 
    iData : in STD_LOGIC_VECTOR ( 10 downto 0 ); 
    aReset : in STD_LOGIC_VECTOR ( 0 downto 0 ); 
    iPush : in STD_LOGIC_VECTOR ( 0 downto 0 ); 
    oDataAck : in STD_LOGIC_VECTOR ( 0 downto 0 ) 
  );
end HandshakeBase;

architecture STRUCTURE of HandshakeBase is
  signal N0 : STD_LOGIC; 
  signal iLclReady_0_and0000 : STD_LOGIC; 
  signal iPushPulse : STD_LOGIC; 
  signal iPushToggle_0_not0001 : STD_LOGIC; 
  signal iRdyPushToggle_ms : STD_LOGIC; 
  signal iReset_ms : STD_LOGIC; 
  signal oPushToggle0_ms : STD_LOGIC; 
  signal oPushToggleChanged : STD_LOGIC; 
  signal iDlyPush : STD_LOGIC_VECTOR ( 0 downto 0 ); 
  signal iLclReady : STD_LOGIC_VECTOR ( 0 downto 0 ); 
  signal NlwRenamedSig_OI_iLclStoredData : STD_LOGIC_VECTOR ( 10 downto 0 ); 
  signal iPushToggle : STD_LOGIC_VECTOR ( 0 downto 0 ); 
  signal iRdyPushToggle : STD_LOGIC_VECTOR ( 0 downto 0 ); 
  signal iReset : STD_LOGIC_VECTOR ( 0 downto 0 ); 
  signal oPushToggle1 : STD_LOGIC_VECTOR ( 0 downto 0 ); 
  signal oPushToggle2 : STD_LOGIC_VECTOR ( 0 downto 0 ); 
  signal oPushToggleToReady : STD_LOGIC_VECTOR ( 0 downto 0 ); 
begin
  iStoredData(10) <= NlwRenamedSig_OI_iLclStoredData(10);
  iStoredData(9) <= NlwRenamedSig_OI_iLclStoredData(9);
  iStoredData(8) <= NlwRenamedSig_OI_iLclStoredData(8);
  iStoredData(7) <= NlwRenamedSig_OI_iLclStoredData(7);
  iStoredData(6) <= NlwRenamedSig_OI_iLclStoredData(6);
  iStoredData(5) <= NlwRenamedSig_OI_iLclStoredData(5);
  iStoredData(4) <= NlwRenamedSig_OI_iLclStoredData(4);
  iStoredData(3) <= NlwRenamedSig_OI_iLclStoredData(3);
  iStoredData(2) <= NlwRenamedSig_OI_iLclStoredData(2);
  iStoredData(1) <= NlwRenamedSig_OI_iLclStoredData(1);
  iStoredData(0) <= NlwRenamedSig_OI_iLclStoredData(0);
  iReady(0) <= iLclReady(0);
  XST_GND : GND
    port map (
      G => N0
    );
  iLclStoredData_0 : FDCE
    port map (
      C => IClk,
      CE => iPushPulse,
      CLR => aReset(0),
      D => iData(0),
      Q => NlwRenamedSig_OI_iLclStoredData(0)
    );
  iLclStoredData_1 : FDCE
    port map (
      C => IClk,
      CE => iPushPulse,
      CLR => aReset(0),
      D => iData(1),
      Q => NlwRenamedSig_OI_iLclStoredData(1)
    );
  iLclStoredData_2 : FDCE
    port map (
      C => IClk,
      CE => iPushPulse,
      CLR => aReset(0),
      D => iData(2),
      Q => NlwRenamedSig_OI_iLclStoredData(2)
    );
  iLclStoredData_3 : FDCE
    port map (
      C => IClk,
      CE => iPushPulse,
      CLR => aReset(0),
      D => iData(3),
      Q => NlwRenamedSig_OI_iLclStoredData(3)
    );
  iLclStoredData_4 : FDCE
    port map (
      C => IClk,
      CE => iPushPulse,
      CLR => aReset(0),
      D => iData(4),
      Q => NlwRenamedSig_OI_iLclStoredData(4)
    );
  iLclStoredData_5 : FDCE
    port map (
      C => IClk,
      CE => iPushPulse,
      CLR => aReset(0),
      D => iData(5),
      Q => NlwRenamedSig_OI_iLclStoredData(5)
    );
  iLclStoredData_6 : FDCE
    port map (
      C => IClk,
      CE => iPushPulse,
      CLR => aReset(0),
      D => iData(6),
      Q => NlwRenamedSig_OI_iLclStoredData(6)
    );
  iLclStoredData_7 : FDCE
    port map (
      C => IClk,
      CE => iPushPulse,
      CLR => aReset(0),
      D => iData(7),
      Q => NlwRenamedSig_OI_iLclStoredData(7)
    );
  iLclStoredData_8 : FDCE
    port map (
      C => IClk,
      CE => iPushPulse,
      CLR => aReset(0),
      D => iData(8),
      Q => NlwRenamedSig_OI_iLclStoredData(8)
    );
  iLclStoredData_9 : FDCE
    port map (
      C => IClk,
      CE => iPushPulse,
      CLR => aReset(0),
      D => iData(9),
      Q => NlwRenamedSig_OI_iLclStoredData(9)
    );
  iLclStoredData_10 : FDCE
    port map (
      C => IClk,
      CE => iPushPulse,
      CLR => aReset(0),
      D => iData(10),
      Q => NlwRenamedSig_OI_iLclStoredData(10)
    );
  iDlyPush_0 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => IClk,
      CLR => aReset(0),
      D => iPush(0),
      Q => iDlyPush(0)
    );
  iLclReady_0 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => IClk,
      CLR => aReset(0),
      D => iLclReady_0_and0000,
      Q => iLclReady(0)
    );
  iPushToggle_0 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => IClk,
      CE => iPushPulse,
      CLR => aReset(0),
      D => iPushToggle_0_not0001,
      Q => iPushToggle(0)
    );
  iReset_ms_0 : FDP
    generic map(
      INIT => '1'
    )
    port map (
      C => IClk,
      D => N0,
      PRE => aReset(0),
      Q => iReset_ms
    );
  iReset_0 : FDP
    generic map(
      INIT => '1'
    )
    port map (
      C => IClk,
      D => iReset_ms,
      PRE => aReset(0),
      Q => iReset(0)
    );
  oPushToggle0_ms_0 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => OClk,
      CLR => aReset(0),
      D => iPushToggle(0),
      Q => oPushToggle0_ms
    );
  oPushToggle1_0 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => OClk,
      CLR => aReset(0),
      D => oPushToggle0_ms,
      Q => oPushToggle1(0)
    );
  oPushToggle2_0 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => OClk,
      CLR => aReset(0),
      D => oPushToggle1(0),
      Q => oPushToggle2(0)
    );
  oPushToggleToReady_0 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => OClk,
      CLR => aReset(0),
      D => oPushToggle2(0),
      Q => oPushToggleToReady(0)
    );
  iRdyPushToggle_ms_0 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => IClk,
      CLR => aReset(0),
      D => oPushToggleToReady(0),
      Q => iRdyPushToggle_ms
    );
  oDataValid_0 : FDC
    port map (
      C => OClk,
      CLR => aReset(0),
      D => oPushToggleChanged,
      Q => oDataValid(0)
    );
  iRdyPushToggle_0 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => IClk,
      CLR => aReset(0),
      D => iRdyPushToggle_ms,
      Q => iRdyPushToggle(0)
    );
  iLclReady_0_and00001 : LUT4
    generic map(
      INIT => X"1001"
    )
    port map (
      I0 => iPush(0),
      I1 => iReset(0),
      I2 => iRdyPushToggle(0),
      I3 => iPushToggle(0),
      O => iLclReady_0_and0000
    );
  iPushPulse_0_and00001 : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => iPush(0),
      I1 => iDlyPush(0),
      O => iPushPulse
    );
  Mxor_oPushToggleChanged_0_Result1 : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => oPushToggle1(0),
      I1 => oPushToggle2(0),
      O => oPushToggleChanged
    );
  iPushToggle_0_not00011_INV_0 : INV
    port map (
      I => iPushToggle(0),
      O => iPushToggle_0_not0001
    );
  BlkOut_ODataFlop_cLclQ_10 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => OClk,
      CE => oPushToggleChanged,
      CLR => aReset(0),
      D => NlwRenamedSig_OI_iLclStoredData(10),
      Q => oData(10)
    );
  BlkOut_ODataFlop_cLclQ_9 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => OClk,
      CE => oPushToggleChanged,
      CLR => aReset(0),
      D => NlwRenamedSig_OI_iLclStoredData(9),
      Q => oData(9)
    );
  BlkOut_ODataFlop_cLclQ_8 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => OClk,
      CE => oPushToggleChanged,
      CLR => aReset(0),
      D => NlwRenamedSig_OI_iLclStoredData(8),
      Q => oData(8)
    );
  BlkOut_ODataFlop_cLclQ_7 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => OClk,
      CE => oPushToggleChanged,
      CLR => aReset(0),
      D => NlwRenamedSig_OI_iLclStoredData(7),
      Q => oData(7)
    );
  BlkOut_ODataFlop_cLclQ_6 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => OClk,
      CE => oPushToggleChanged,
      CLR => aReset(0),
      D => NlwRenamedSig_OI_iLclStoredData(6),
      Q => oData(6)
    );
  BlkOut_ODataFlop_cLclQ_5 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => OClk,
      CE => oPushToggleChanged,
      CLR => aReset(0),
      D => NlwRenamedSig_OI_iLclStoredData(5),
      Q => oData(5)
    );
  BlkOut_ODataFlop_cLclQ_4 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => OClk,
      CE => oPushToggleChanged,
      CLR => aReset(0),
      D => NlwRenamedSig_OI_iLclStoredData(4),
      Q => oData(4)
    );
  BlkOut_ODataFlop_cLclQ_3 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => OClk,
      CE => oPushToggleChanged,
      CLR => aReset(0),
      D => NlwRenamedSig_OI_iLclStoredData(3),
      Q => oData(3)
    );
  BlkOut_ODataFlop_cLclQ_2 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => OClk,
      CE => oPushToggleChanged,
      CLR => aReset(0),
      D => NlwRenamedSig_OI_iLclStoredData(2),
      Q => oData(2)
    );
  BlkOut_ODataFlop_cLclQ_1 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => OClk,
      CE => oPushToggleChanged,
      CLR => aReset(0),
      D => NlwRenamedSig_OI_iLclStoredData(1),
      Q => oData(1)
    );
  BlkOut_ODataFlop_cLclQ_0 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => OClk,
      CE => oPushToggleChanged,
      CLR => aReset(0),
      D => NlwRenamedSig_OI_iLclStoredData(0),
      Q => oData(0)
    );

end STRUCTURE;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
use UNISIM.VPKG.ALL;

entity HandshakeSLV is
  port (
    OClk : in STD_LOGIC := 'X'; 
    IClk : in STD_LOGIC := 'X'; 
    oDataValid : out STD_LOGIC_VECTOR ( 0 downto 0 ); 
    oData : out STD_LOGIC_VECTOR ( 10 downto 0 ); 
    iReady : out STD_LOGIC_VECTOR ( 0 downto 0 ); 
    iData : in STD_LOGIC_VECTOR ( 10 downto 0 ); 
    aReset : in STD_LOGIC_VECTOR ( 0 downto 0 ); 
    iPush : in STD_LOGIC_VECTOR ( 0 downto 0 ) 
  );
end HandshakeSLV;

architecture STRUCTURE of HandshakeSLV is
  component HandshakeBase
    port (
      OClk : in STD_LOGIC := 'X'; 
      IClk : in STD_LOGIC := 'X'; 
      iStoredData : out STD_LOGIC_VECTOR ( 10 downto 0 ); 
      oDataValid : out STD_LOGIC_VECTOR ( 0 downto 0 ); 
      oData : out STD_LOGIC_VECTOR ( 10 downto 0 ); 
      iReady : out STD_LOGIC_VECTOR ( 0 downto 0 ); 
      iData : in STD_LOGIC_VECTOR ( 10 downto 0 ); 
      aReset : in STD_LOGIC_VECTOR ( 0 downto 0 ); 
      iPush : in STD_LOGIC_VECTOR ( 0 downto 0 ); 
      oDataAck : in STD_LOGIC_VECTOR ( 0 downto 0 ) 
    );
  end component;
  signal NLW_HBx_iStoredData_10_UNCONNECTED : STD_LOGIC; 
  signal NLW_HBx_iStoredData_9_UNCONNECTED : STD_LOGIC; 
  signal NLW_HBx_iStoredData_8_UNCONNECTED : STD_LOGIC; 
  signal NLW_HBx_iStoredData_7_UNCONNECTED : STD_LOGIC; 
  signal NLW_HBx_iStoredData_6_UNCONNECTED : STD_LOGIC; 
  signal NLW_HBx_iStoredData_5_UNCONNECTED : STD_LOGIC; 
  signal NLW_HBx_iStoredData_4_UNCONNECTED : STD_LOGIC; 
  signal NLW_HBx_iStoredData_3_UNCONNECTED : STD_LOGIC; 
  signal NLW_HBx_iStoredData_2_UNCONNECTED : STD_LOGIC; 
  signal NLW_HBx_iStoredData_1_UNCONNECTED : STD_LOGIC; 
  signal NLW_HBx_iStoredData_0_UNCONNECTED : STD_LOGIC; 
  signal NLW_HBx_oDataAck_0_UNCONNECTED : STD_LOGIC; 
begin
  HBx : HandshakeBase
    port map (
      OClk => OClk,
      IClk => IClk,
      iStoredData(10) => NLW_HBx_iStoredData_10_UNCONNECTED,
      iStoredData(9) => NLW_HBx_iStoredData_9_UNCONNECTED,
      iStoredData(8) => NLW_HBx_iStoredData_8_UNCONNECTED,
      iStoredData(7) => NLW_HBx_iStoredData_7_UNCONNECTED,
      iStoredData(6) => NLW_HBx_iStoredData_6_UNCONNECTED,
      iStoredData(5) => NLW_HBx_iStoredData_5_UNCONNECTED,
      iStoredData(4) => NLW_HBx_iStoredData_4_UNCONNECTED,
      iStoredData(3) => NLW_HBx_iStoredData_3_UNCONNECTED,
      iStoredData(2) => NLW_HBx_iStoredData_2_UNCONNECTED,
      iStoredData(1) => NLW_HBx_iStoredData_1_UNCONNECTED,
      iStoredData(0) => NLW_HBx_iStoredData_0_UNCONNECTED,
      oDataValid(0) => oDataValid(0),
      oData(10) => oData(10),
      oData(9) => oData(9),
      oData(8) => oData(8),
      oData(7) => oData(7),
      oData(6) => oData(6),
      oData(5) => oData(5),
      oData(4) => oData(4),
      oData(3) => oData(3),
      oData(2) => oData(2),
      oData(1) => oData(1),
      oData(0) => oData(0),
      iReady(0) => iReady(0),
      iData(10) => iData(10),
      iData(9) => iData(9),
      iData(8) => iData(8),
      iData(7) => iData(7),
      iData(6) => iData(6),
      iData(5) => iData(5),
      iData(4) => iData(4),
      iData(3) => iData(3),
      iData(2) => iData(2),
      iData(1) => iData(1),
      iData(0) => iData(0),
      aReset(0) => aReset(0),
      iPush(0) => iPush(0),
      oDataAck(0) => NLW_HBx_oDataAck_0_UNCONNECTED
    );

end STRUCTURE;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
use UNISIM.VPKG.ALL;

entity Tdc is
  port (
    sEnableMeas : in STD_LOGIC := 'X'; 
    sMeasDoneRE : out STD_LOGIC; 
    sTrigEnIn : in STD_LOGIC := 'X'; 
    sRolloverErr : out STD_LOGIC; 
    FasterClk : in STD_LOGIC := 'X'; 
    SampleClk : in STD_LOGIC := 'X'; 
    aArmCounter : in STD_LOGIC := 'X'; 
    sCountValid : out STD_LOGIC; 
    aReset : in STD_LOGIC := 'X'; 
    aTimeRefIn : in STD_LOGIC := 'X'; 
    sReadyToMeas : out STD_LOGIC; 
    sCountOut : out STD_LOGIC_VECTOR ( 15 downto 0 ) 
  );
end Tdc;

architecture STRUCTURE of Tdc is
  component HandshakeSLV
    port (
      OClk : in STD_LOGIC := 'X'; 
      IClk : in STD_LOGIC := 'X'; 
      oDataValid : out STD_LOGIC_VECTOR ( 0 downto 0 ); 
      oData : out STD_LOGIC_VECTOR ( 10 downto 0 ); 
      iReady : out STD_LOGIC_VECTOR ( 0 downto 0 ); 
      iData : in STD_LOGIC_VECTOR ( 10 downto 0 ); 
      aReset : in STD_LOGIC_VECTOR ( 0 downto 0 ); 
      iPush : in STD_LOGIC_VECTOR ( 0 downto 0 ) 
    );
  end component;
  signal N02 : STD_LOGIC; 
  signal N1 : STD_LOGIC; 
  signal N11 : STD_LOGIC; 
  signal N13 : STD_LOGIC; 
  signal N14 : STD_LOGIC; 
  signal N181 : STD_LOGIC; 
  signal N19 : STD_LOGIC; 
  signal N5 : STD_LOGIC; 
  signal N6 : STD_LOGIC; 
  signal N81 : STD_LOGIC; 
  signal fArmCounter_130 : STD_LOGIC; 
  signal fArmCounterDly_131 : STD_LOGIC; 
  signal fArmCounter_ms_132 : STD_LOGIC; 
  signal fCountHsPush_133 : STD_LOGIC; 
  signal fCountHsPush_mux0000 : STD_LOGIC; 
  signal fCountHsReadyBool : STD_LOGIC; 
  signal fCountMsbSet_136 : STD_LOGIC; 
  signal fCountMsbSet_mux0000 : STD_LOGIC; 
  signal fCount_mux0000_1_1_164 : STD_LOGIC; 
  signal fCount_mux0000_1_2_165 : STD_LOGIC; 
  signal fCount_mux0000_4_1_169 : STD_LOGIC; 
  signal fCount_mux0000_4_2_170 : STD_LOGIC; 
  signal fEnableMeas_174 : STD_LOGIC; 
  signal fEnableMeas_ms_175 : STD_LOGIC; 
  signal fExtraHalf_176 : STD_LOGIC; 
  signal fExtraHalf_mux0000 : STD_LOGIC; 
  signal fExtraHalf_mux00001_178 : STD_LOGIC; 
  signal fExtraHalf_mux00002_179 : STD_LOGIC; 
  signal fIddrQ1 : STD_LOGIC; 
  signal fIddrQ1dly_181 : STD_LOGIC; 
  signal fIddrQ2 : STD_LOGIC; 
  signal fIddrQ2Dly_183 : STD_LOGIC; 
  signal fMeasDone_184 : STD_LOGIC; 
  signal fMeasDone_mux0000 : STD_LOGIC; 
  signal fMinusHalf_186 : STD_LOGIC; 
  signal fMinusHalf_mux0000 : STD_LOGIC; 
  signal fReadyToMeas_188 : STD_LOGIC; 
  signal fReadyToMeas_mux0001 : STD_LOGIC; 
  signal fRolloverErr_190 : STD_LOGIC; 
  signal fRolloverErr_mux0000 : STD_LOGIC; 
  signal fTdcState_FSM_FFd1_192 : STD_LOGIC; 
  signal fTdcState_FSM_FFd1_In : STD_LOGIC; 
  signal fTdcState_FSM_FFd1_In1_194 : STD_LOGIC; 
  signal fTdcState_FSM_FFd1_In2_195 : STD_LOGIC; 
  signal fTdcState_FSM_FFd2_196 : STD_LOGIC; 
  signal fTdcState_FSM_FFd2_In : STD_LOGIC; 
  signal fTrigEnInFallEdge_198 : STD_LOGIC; 
  signal fTrigEnInFallEdgeDly_199 : STD_LOGIC; 
  signal fTrigEnRisEdge_200 : STD_LOGIC; 
  signal fTrigEnRisEdgeDly_201 : STD_LOGIC; 
  signal sCountOut_xor0000 : STD_LOGIC; 
  signal sCountValidDly_224 : STD_LOGIC; 
  signal sCountValidInt : STD_LOGIC; 
  signal sEnableMeasReg_229 : STD_LOGIC; 
  signal sMeasDone_230 : STD_LOGIC; 
  signal sMeasDoneDly_231 : STD_LOGIC; 
  signal sMeasDoneRE_and0000 : STD_LOGIC; 
  signal sReadyToMeas_ms_235 : STD_LOGIC; 
  signal sTrigEnReg_238 : STD_LOGIC; 
  signal Madd_sCountOutFlat_cy : STD_LOGIC_VECTOR ( 2 downto 2 ); 
  signal Madd_sCountOutFlat_lut : STD_LOGIC_VECTOR ( 8 downto 3 ); 
  signal Madd_sCountOutMinus_cy : STD_LOGIC_VECTOR ( 1 downto 1 ); 
  signal fCountOut : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal fCountOut_mux0000 : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal fCount : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal fCount_mux0000 : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal NlwRenamedSig_OI_sCountOut : STD_LOGIC_VECTOR ( 10 downto 10 ); 
  signal sCountOut_mux0002 : STD_LOGIC_VECTOR ( 9 downto 1 ); 
  signal sCountWord : STD_LOGIC_VECTOR ( 9 downto 8 ); 
begin
  sCountOut(15) <= NlwRenamedSig_OI_sCountOut(10);
  sCountOut(14) <= NlwRenamedSig_OI_sCountOut(10);
  sCountOut(13) <= NlwRenamedSig_OI_sCountOut(10);
  sCountOut(12) <= NlwRenamedSig_OI_sCountOut(10);
  sCountOut(11) <= NlwRenamedSig_OI_sCountOut(10);
  sCountOut(10) <= NlwRenamedSig_OI_sCountOut(10);
  XST_GND : GND
    port map (
      G => NlwRenamedSig_OI_sCountOut(10)
    );
  XST_VCC : VCC
    port map (
      P => N1
    );
  fCount_0 : FDC
    port map (
      C => FasterClk,
      CLR => aReset,
      D => fCount_mux0000(7),
      Q => fCount(0)
    );
  fCount_1 : FDC
    port map (
      C => FasterClk,
      CLR => aReset,
      D => fCount_mux0000(6),
      Q => fCount(1)
    );
  fCount_2 : FDC
    port map (
      C => FasterClk,
      CLR => aReset,
      D => fCount_mux0000(5),
      Q => fCount(2)
    );
  fCount_3 : FDC
    port map (
      C => FasterClk,
      CLR => aReset,
      D => fCount_mux0000(4),
      Q => fCount(3)
    );
  fCount_4 : FDC
    port map (
      C => FasterClk,
      CLR => aReset,
      D => fCount_mux0000(3),
      Q => fCount(4)
    );
  fCount_5 : FDC
    port map (
      C => FasterClk,
      CLR => aReset,
      D => fCount_mux0000(2),
      Q => fCount(5)
    );
  fCount_6 : FDC
    port map (
      C => FasterClk,
      CLR => aReset,
      D => fCount_mux0000(1),
      Q => fCount(6)
    );
  fCount_7 : FDC
    port map (
      C => FasterClk,
      CLR => aReset,
      D => fCount_mux0000(0),
      Q => fCount(7)
    );
  sTrigEnReg : FDC
    port map (
      C => SampleClk,
      CLR => aReset,
      D => sTrigEnIn,
      Q => sTrigEnReg_238
    );
  fCountOut_0 : FDC
    port map (
      C => FasterClk,
      CLR => aReset,
      D => fCountOut_mux0000(7),
      Q => fCountOut(0)
    );
  fCountOut_1 : FDC
    port map (
      C => FasterClk,
      CLR => aReset,
      D => fCountOut_mux0000(6),
      Q => fCountOut(1)
    );
  fCountOut_2 : FDC
    port map (
      C => FasterClk,
      CLR => aReset,
      D => fCountOut_mux0000(5),
      Q => fCountOut(2)
    );
  fCountOut_3 : FDC
    port map (
      C => FasterClk,
      CLR => aReset,
      D => fCountOut_mux0000(4),
      Q => fCountOut(3)
    );
  fCountOut_4 : FDC
    port map (
      C => FasterClk,
      CLR => aReset,
      D => fCountOut_mux0000(3),
      Q => fCountOut(4)
    );
  fCountOut_5 : FDC
    port map (
      C => FasterClk,
      CLR => aReset,
      D => fCountOut_mux0000(2),
      Q => fCountOut(5)
    );
  fCountOut_6 : FDC
    port map (
      C => FasterClk,
      CLR => aReset,
      D => fCountOut_mux0000(1),
      Q => fCountOut(6)
    );
  fCountOut_7 : FDC
    port map (
      C => FasterClk,
      CLR => aReset,
      D => fCountOut_mux0000(0),
      Q => fCountOut(7)
    );
  sMeasDoneRE_20 : FDC
    port map (
      C => SampleClk,
      CLR => aReset,
      D => sMeasDoneRE_and0000,
      Q => sMeasDoneRE
    );
  sEnableMeasReg : FDC
    port map (
      C => SampleClk,
      CLR => aReset,
      D => sEnableMeas,
      Q => sEnableMeasReg_229
    );
  fRolloverErr : FDC
    port map (
      C => FasterClk,
      CLR => aReset,
      D => fRolloverErr_mux0000,
      Q => fRolloverErr_190
    );
  fMinusHalf : FDC
    port map (
      C => FasterClk,
      CLR => aReset,
      D => fMinusHalf_mux0000,
      Q => fMinusHalf_186
    );
  fReadyToMeas : FDC
    port map (
      C => FasterClk,
      CLR => aReset,
      D => fReadyToMeas_mux0001,
      Q => fReadyToMeas_188
    );
  fExtraHalf : FDC
    port map (
      C => FasterClk,
      CLR => aReset,
      D => fExtraHalf_mux0000,
      Q => fExtraHalf_176
    );
  fArmCounter_ms : FDC
    port map (
      C => FasterClk,
      CLR => aReset,
      D => aArmCounter,
      Q => fArmCounter_ms_132
    );
  fCountMsbSet : FDC
    port map (
      C => FasterClk,
      CLR => aReset,
      D => fCountMsbSet_mux0000,
      Q => fCountMsbSet_136
    );
  fCountHsPush : FDC
    port map (
      C => FasterClk,
      CLR => aReset,
      D => fCountHsPush_mux0000,
      Q => fCountHsPush_133
    );
  fMeasDone : FDC
    port map (
      C => FasterClk,
      CLR => aReset,
      D => fMeasDone_mux0000,
      Q => fMeasDone_184
    );
  sCountOut_0 : FDC
    port map (
      C => SampleClk,
      CLR => aReset,
      D => sCountOut_xor0000,
      Q => sCountOut(0)
    );
  sCountOut_1 : FDC
    port map (
      C => SampleClk,
      CLR => aReset,
      D => sCountOut_mux0002(1),
      Q => sCountOut(1)
    );
  sCountOut_2 : FDC
    port map (
      C => SampleClk,
      CLR => aReset,
      D => sCountOut_mux0002(2),
      Q => sCountOut(2)
    );
  sCountOut_3 : FDC
    port map (
      C => SampleClk,
      CLR => aReset,
      D => sCountOut_mux0002(3),
      Q => sCountOut(3)
    );
  sCountOut_4 : FDC
    port map (
      C => SampleClk,
      CLR => aReset,
      D => sCountOut_mux0002(4),
      Q => sCountOut(4)
    );
  sCountOut_5 : FDC
    port map (
      C => SampleClk,
      CLR => aReset,
      D => sCountOut_mux0002(5),
      Q => sCountOut(5)
    );
  sCountOut_6 : FDC
    port map (
      C => SampleClk,
      CLR => aReset,
      D => sCountOut_mux0002(6),
      Q => sCountOut(6)
    );
  sCountOut_7 : FDC
    port map (
      C => SampleClk,
      CLR => aReset,
      D => sCountOut_mux0002(7),
      Q => sCountOut(7)
    );
  sCountOut_8 : FDC
    port map (
      C => SampleClk,
      CLR => aReset,
      D => sCountOut_mux0002(8),
      Q => sCountOut(8)
    );
  sCountOut_9 : FDC
    port map (
      C => SampleClk,
      CLR => aReset,
      D => sCountOut_mux0002(9),
      Q => sCountOut(9)
    );
  fTrigEnInFallEdge : FDC_1
    port map (
      C => FasterClk,
      CLR => aReset,
      D => sTrigEnReg_238,
      Q => fTrigEnInFallEdge_198
    );
  fEnableMeas_ms : FDC
    port map (
      C => FasterClk,
      CLR => aReset,
      D => sEnableMeasReg_229,
      Q => fEnableMeas_ms_175
    );
  fIddrQ1dly : FDC
    port map (
      C => FasterClk,
      CLR => aReset,
      D => fIddrQ1,
      Q => fIddrQ1dly_181
    );
  fTrigEnRisEdge : FDC
    port map (
      C => FasterClk,
      CLR => aReset,
      D => sTrigEnReg_238,
      Q => fTrigEnRisEdge_200
    );
  sMeasDone : FDC
    port map (
      C => SampleClk,
      CLR => aReset,
      D => fMeasDone_184,
      Q => sMeasDone_230
    );
  fIddrQ2Dly : FDC
    port map (
      C => FasterClk,
      CLR => aReset,
      D => fIddrQ2,
      Q => fIddrQ2Dly_183
    );
  fArmCounter : FDC
    port map (
      C => FasterClk,
      CLR => aReset,
      D => fArmCounter_ms_132,
      Q => fArmCounter_130
    );
  sReadyToMeas_ms : FDC
    port map (
      C => SampleClk,
      CLR => aReset,
      D => fReadyToMeas_188,
      Q => sReadyToMeas_ms_235
    );
  sCountValidDly : FDC
    port map (
      C => SampleClk,
      CLR => aReset,
      D => sCountValidInt,
      Q => sCountValidDly_224
    );
  fTrigEnInFallEdgeDly : FDC
    port map (
      C => FasterClk,
      CLR => aReset,
      D => fTrigEnInFallEdge_198,
      Q => fTrigEnInFallEdgeDly_199
    );
  fArmCounterDly : FDC
    port map (
      C => FasterClk,
      CLR => aReset,
      D => fArmCounter_130,
      Q => fArmCounterDly_131
    );
  fEnableMeas : FDC
    port map (
      C => FasterClk,
      CLR => aReset,
      D => fEnableMeas_ms_175,
      Q => fEnableMeas_174
    );
  fTrigEnRisEdgeDly : FDC
    port map (
      C => FasterClk,
      CLR => aReset,
      D => fTrigEnRisEdge_200,
      Q => fTrigEnRisEdgeDly_201
    );
  sReadyToMeas_53 : FDC
    port map (
      C => SampleClk,
      CLR => aReset,
      D => sReadyToMeas_ms_235,
      Q => sReadyToMeas
    );
  sMeasDoneDly : FDC
    port map (
      C => SampleClk,
      CLR => aReset,
      D => sMeasDone_230,
      Q => sMeasDoneDly_231
    );
  sCountValid_55 : FDC
    port map (
      C => SampleClk,
      CLR => aReset,
      D => sCountValidDly_224,
      Q => sCountValid
    );
  TimeRefSamplerIddr : IDDR_2CLK
    generic map(
      DDR_CLK_EDGE => "SAME_EDGE_PIPELINED",
      SRTYPE => "ASYNC",
      INIT_Q1 => '0',
      INIT_Q2 => '0'
    )
    port map (
      D => aTimeRefIn,
      CE => N1,
      C => FasterClk,
      CB => N6,
      S => NlwRenamedSig_OI_sCountOut(10),
      R => aReset,
      Q1 => fIddrQ1,
      Q2 => fIddrQ2
    );
  fTdcState_FSM_FFd1 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => FasterClk,
      CLR => aReset,
      D => fTdcState_FSM_FFd1_In,
      Q => fTdcState_FSM_FFd1_192
    );
  fTdcState_FSM_FFd2 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => FasterClk,
      CLR => aReset,
      D => fTdcState_FSM_FFd2_In,
      Q => fTdcState_FSM_FFd2_196
    );
  TdcHandshake : HandshakeSLV
    port map (
      OClk => SampleClk,
      IClk => FasterClk,
      oDataValid(0) => sCountValidInt,
      oData(10) => sRolloverErr,
      oData(9) => sCountWord(9),
      oData(8) => sCountWord(8),
      oData(7) => Madd_sCountOutFlat_lut(8),
      oData(6) => Madd_sCountOutFlat_lut(7),
      oData(5) => Madd_sCountOutFlat_lut(6),
      oData(4) => Madd_sCountOutFlat_lut(5),
      oData(3) => Madd_sCountOutFlat_lut(4),
      oData(2) => Madd_sCountOutFlat_lut(3),
      oData(1) => Madd_sCountOutFlat_cy(2),
      oData(0) => Madd_sCountOutMinus_cy(1),
      iReady(0) => fCountHsReadyBool,
      iData(10) => fRolloverErr_190,
      iData(9) => fExtraHalf_176,
      iData(8) => fMinusHalf_186,
      iData(7) => fCountOut(7),
      iData(6) => fCountOut(6),
      iData(5) => fCountOut(5),
      iData(4) => fCountOut(4),
      iData(3) => fCountOut(3),
      iData(2) => fCountOut(2),
      iData(1) => fCountOut(1),
      iData(0) => fCountOut(0),
      aReset(0) => aReset,
      iPush(0) => fCountHsPush_133
    );
  sMeasDoneRE_and00001 : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => sMeasDone_230,
      I1 => sMeasDoneDly_231,
      O => sMeasDoneRE_and0000
    );
  Mxor_sCountOut_xor0000_Result1 : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => sCountWord(9),
      I1 => sCountWord(8),
      O => sCountOut_xor0000
    );
  fReadyToMeas_mux00011 : LUT3
    generic map(
      INIT => X"02"
    )
    port map (
      I0 => fEnableMeas_174,
      I1 => fTdcState_FSM_FFd2_196,
      I2 => fTdcState_FSM_FFd1_192,
      O => fReadyToMeas_mux0001
    );
  sCountOut_mux0002_1_1 : LUT3
    generic map(
      INIT => X"9A"
    )
    port map (
      I0 => Madd_sCountOutMinus_cy(1),
      I1 => sCountWord(9),
      I2 => sCountWord(8),
      O => sCountOut_mux0002(1)
    );
  fCountMsbSet_mux00001 : LUT4
    generic map(
      INIT => X"E8C8"
    )
    port map (
      I0 => fTdcState_FSM_FFd1_192,
      I1 => fCountMsbSet_136,
      I2 => fTdcState_FSM_FFd2_196,
      I3 => fCount(7),
      O => fCountMsbSet_mux0000
    );
  sCountOut_mux0002_2_1 : LUT4
    generic map(
      INIT => X"5655"
    )
    port map (
      I0 => Madd_sCountOutFlat_cy(2),
      I1 => Madd_sCountOutMinus_cy(1),
      I2 => sCountWord(9),
      I3 => sCountWord(8),
      O => sCountOut_mux0002(2)
    );
  fRolloverErr_mux00001 : LUT5
    generic map(
      INIT => X"C8C8E8C8"
    )
    port map (
      I0 => fTdcState_FSM_FFd2_196,
      I1 => fRolloverErr_190,
      I2 => fTdcState_FSM_FFd1_192,
      I3 => fCountMsbSet_136,
      I4 => fCount(7),
      O => fRolloverErr_mux0000
    );
  sCountOut_mux0002_3_1 : LUT5
    generic map(
      INIT => X"66666C66"
    )
    port map (
      I0 => Madd_sCountOutFlat_cy(2),
      I1 => Madd_sCountOutFlat_lut(3),
      I2 => Madd_sCountOutMinus_cy(1),
      I3 => sCountWord(8),
      I4 => sCountWord(9),
      O => sCountOut_mux0002(3)
    );
  sCountOut_mux0002_5_1 : LUT3
    generic map(
      INIT => X"9A"
    )
    port map (
      I0 => Madd_sCountOutFlat_lut(5),
      I1 => N81,
      I2 => Madd_sCountOutFlat_lut(4),
      O => sCountOut_mux0002(5)
    );
  sCountOut_mux0002_6_1 : LUT4
    generic map(
      INIT => X"9AAA"
    )
    port map (
      I0 => Madd_sCountOutFlat_lut(6),
      I1 => N81,
      I2 => Madd_sCountOutFlat_lut(5),
      I3 => Madd_sCountOutFlat_lut(4),
      O => sCountOut_mux0002(6)
    );
  sCountOut_mux0002_4_11 : LUT5
    generic map(
      INIT => X"02FFFFFF"
    )
    port map (
      I0 => sCountWord(8),
      I1 => sCountWord(9),
      I2 => Madd_sCountOutMinus_cy(1),
      I3 => Madd_sCountOutFlat_lut(3),
      I4 => Madd_sCountOutFlat_cy(2),
      O => N81
    );
  sCountOut_mux0002_7_1 : LUT5
    generic map(
      INIT => X"9AAAAAAA"
    )
    port map (
      I0 => Madd_sCountOutFlat_lut(7),
      I1 => N81,
      I2 => Madd_sCountOutFlat_lut(6),
      I3 => Madd_sCountOutFlat_lut(5),
      I4 => Madd_sCountOutFlat_lut(4),
      O => sCountOut_mux0002(7)
    );
  sCountOut_mux0002_9_1 : LUT6
    generic map(
      INIT => X"0000800000000000"
    )
    port map (
      I0 => Madd_sCountOutFlat_lut(7),
      I1 => Madd_sCountOutFlat_lut(8),
      I2 => Madd_sCountOutFlat_lut(5),
      I3 => Madd_sCountOutFlat_lut(6),
      I4 => N81,
      I5 => Madd_sCountOutFlat_lut(4),
      O => sCountOut_mux0002(9)
    );
  fTdcState_FSM_FFd2_In1 : LUT6
    generic map(
      INIT => X"88888A8808080A08"
    )
    port map (
      I0 => fEnableMeas_174,
      I1 => fTdcState_FSM_FFd2_196,
      I2 => fTdcState_FSM_FFd1_192,
      I3 => fArmCounter_130,
      I4 => fArmCounterDly_131,
      I5 => N02,
      O => fTdcState_FSM_FFd2_In
    );
  sCountOut_mux0002_8_1 : LUT6
    generic map(
      INIT => X"9AAAAAAAAAAAAAAA"
    )
    port map (
      I0 => Madd_sCountOutFlat_lut(8),
      I1 => N81,
      I2 => Madd_sCountOutFlat_lut(7),
      I3 => Madd_sCountOutFlat_lut(6),
      I4 => Madd_sCountOutFlat_lut(5),
      I5 => Madd_sCountOutFlat_lut(4),
      O => sCountOut_mux0002(8)
    );
  fCount_mux0000_5_1 : LUT6
    generic map(
      INIT => X"C6CCCCCC82888888"
    )
    port map (
      I0 => fTdcState_FSM_FFd1_192,
      I1 => fCount(2),
      I2 => N181,
      I3 => fCount(1),
      I4 => fCount(0),
      I5 => fTdcState_FSM_FFd2_196,
      O => fCount_mux0000(5)
    );
  fCount_mux0000_0_41 : LUT6
    generic map(
      INIT => X"0000800000000000"
    )
    port map (
      I0 => fCount(1),
      I1 => fCount(3),
      I2 => fTdcState_FSM_FFd1_192,
      I3 => fCount(0),
      I4 => N181,
      I5 => fCount(2),
      O => N19
    );
  fCount_mux0000_2_2 : LUT6
    generic map(
      INIT => X"F7D5A280A280A280"
    )
    port map (
      I0 => fCount(5),
      I1 => fTdcState_FSM_FFd1_192,
      I2 => N5,
      I3 => fTdcState_FSM_FFd2_196,
      I4 => N19,
      I5 => fCount(4),
      O => fCount_mux0000(2)
    );
  fCount_mux0000_3_SW0 : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => fCount(3),
      I1 => fCount(2),
      I2 => fCount(1),
      I3 => fCount(0),
      O => N11
    );
  fCount_mux0000_3_Q : LUT6
    generic map(
      INIT => X"FB3BC808FBFBC8C8"
    )
    port map (
      I0 => fTdcState_FSM_FFd2_196,
      I1 => fCount(4),
      I2 => fTdcState_FSM_FFd1_192,
      I3 => N181,
      I4 => N19,
      I5 => N11,
      O => fCount_mux0000(3)
    );
  fCount_mux0000_6_11 : LUT2
    generic map(
      INIT => X"D"
    )
    port map (
      I0 => fTrigEnRisEdge_200,
      I1 => fTrigEnRisEdgeDly_201,
      O => N02
    );
  fCount_mux0000_2_11 : LUT6
    generic map(
      INIT => X"DFFFFFFFFFFFFFFF"
    )
    port map (
      I0 => fCount(4),
      I1 => N181,
      I2 => fCount(2),
      I3 => fCount(0),
      I4 => fCount(1),
      I5 => fCount(3),
      O => N5
    );
  sCountOut_mux0002_4_2 : LUT6
    generic map(
      INIT => X"5AAA6AAA5AAA5AAA"
    )
    port map (
      I0 => Madd_sCountOutFlat_lut(4),
      I1 => Madd_sCountOutMinus_cy(1),
      I2 => Madd_sCountOutFlat_cy(2),
      I3 => Madd_sCountOutFlat_lut(3),
      I4 => sCountWord(9),
      I5 => sCountWord(8),
      O => sCountOut_mux0002(4)
    );
  fMinusHalf_mux00001 : LUT6
    generic map(
      INIT => X"A8E8A8A8A828A8A8"
    )
    port map (
      I0 => fMinusHalf_186,
      I1 => fTdcState_FSM_FFd2_196,
      I2 => fTdcState_FSM_FFd1_192,
      I3 => N02,
      I4 => fEnableMeas_174,
      I5 => fTrigEnInFallEdgeDly_199,
      O => fMinusHalf_mux0000
    );
  fCountOut_mux0000_7_1 : LUT6
    generic map(
      INIT => X"A8E8A8A8A828A8A8"
    )
    port map (
      I0 => fCountOut(0),
      I1 => fTdcState_FSM_FFd2_196,
      I2 => fTdcState_FSM_FFd1_192,
      I3 => N02,
      I4 => fEnableMeas_174,
      I5 => fCount(0),
      O => fCountOut_mux0000(7)
    );
  fCountOut_mux0000_6_1 : LUT6
    generic map(
      INIT => X"A8E8A8A8A828A8A8"
    )
    port map (
      I0 => fCountOut(1),
      I1 => fTdcState_FSM_FFd2_196,
      I2 => fTdcState_FSM_FFd1_192,
      I3 => N02,
      I4 => fEnableMeas_174,
      I5 => fCount(1),
      O => fCountOut_mux0000(6)
    );
  fCountOut_mux0000_5_1 : LUT6
    generic map(
      INIT => X"A8E8A8A8A828A8A8"
    )
    port map (
      I0 => fCountOut(2),
      I1 => fTdcState_FSM_FFd2_196,
      I2 => fTdcState_FSM_FFd1_192,
      I3 => N02,
      I4 => fEnableMeas_174,
      I5 => fCount(2),
      O => fCountOut_mux0000(5)
    );
  fCountOut_mux0000_4_1 : LUT6
    generic map(
      INIT => X"A8E8A8A8A828A8A8"
    )
    port map (
      I0 => fCountOut(3),
      I1 => fTdcState_FSM_FFd2_196,
      I2 => fTdcState_FSM_FFd1_192,
      I3 => N02,
      I4 => fEnableMeas_174,
      I5 => fCount(3),
      O => fCountOut_mux0000(4)
    );
  fCountOut_mux0000_3_1 : LUT6
    generic map(
      INIT => X"A8E8A8A8A828A8A8"
    )
    port map (
      I0 => fCountOut(4),
      I1 => fTdcState_FSM_FFd2_196,
      I2 => fTdcState_FSM_FFd1_192,
      I3 => N02,
      I4 => fEnableMeas_174,
      I5 => fCount(4),
      O => fCountOut_mux0000(3)
    );
  fCountOut_mux0000_2_1 : LUT6
    generic map(
      INIT => X"A8E8A8A8A828A8A8"
    )
    port map (
      I0 => fCountOut(5),
      I1 => fTdcState_FSM_FFd2_196,
      I2 => fTdcState_FSM_FFd1_192,
      I3 => N02,
      I4 => fEnableMeas_174,
      I5 => fCount(5),
      O => fCountOut_mux0000(2)
    );
  fCountOut_mux0000_1_1 : LUT6
    generic map(
      INIT => X"A8E8A8A8A828A8A8"
    )
    port map (
      I0 => fCountOut(6),
      I1 => fTdcState_FSM_FFd2_196,
      I2 => fTdcState_FSM_FFd1_192,
      I3 => N02,
      I4 => fEnableMeas_174,
      I5 => fCount(6),
      O => fCountOut_mux0000(1)
    );
  fCountOut_mux0000_0_1 : LUT6
    generic map(
      INIT => X"A8E8A8A8A828A8A8"
    )
    port map (
      I0 => fCountOut(7),
      I1 => fTdcState_FSM_FFd2_196,
      I2 => fTdcState_FSM_FFd1_192,
      I3 => N02,
      I4 => fEnableMeas_174,
      I5 => fCount(7),
      O => fCountOut_mux0000(0)
    );
  fCount_mux0000_6_2 : LUT6
    generic map(
      INIT => X"68C8C8C8C8C8C8C8"
    )
    port map (
      I0 => fTdcState_FSM_FFd2_196,
      I1 => fCount(1),
      I2 => fTdcState_FSM_FFd1_192,
      I3 => fEnableMeas_174,
      I4 => N02,
      I5 => fCount(0),
      O => fCount_mux0000(6)
    );
  fCountHsPush_mux00001 : LUT6
    generic map(
      INIT => X"AAAAAAAA00008000"
    )
    port map (
      I0 => fTdcState_FSM_FFd2_196,
      I1 => fTdcState_FSM_FFd1_192,
      I2 => fEnableMeas_174,
      I3 => fTrigEnRisEdge_200,
      I4 => fTrigEnRisEdgeDly_201,
      I5 => fCountHsPush_133,
      O => fCountHsPush_mux0000
    );
  fMeasDone_mux00001 : LUT6
    generic map(
      INIT => X"A8A8E8A8A8A8A8A8"
    )
    port map (
      I0 => fMeasDone_184,
      I1 => fTdcState_FSM_FFd1_192,
      I2 => fTdcState_FSM_FFd2_196,
      I3 => fTrigEnRisEdge_200,
      I4 => fTrigEnRisEdgeDly_201,
      I5 => fEnableMeas_174,
      O => fMeasDone_mux0000
    );
  fCount_mux0000_7_11 : LUT4
    generic map(
      INIT => X"77F7"
    )
    port map (
      I0 => fEnableMeas_174,
      I1 => fTdcState_FSM_FFd2_196,
      I2 => fTrigEnRisEdge_200,
      I3 => fTrigEnRisEdgeDly_201,
      O => N181
    );
  fCount_mux0000_7_2 : LUT6
    generic map(
      INIT => X"6868C868C8C8C8C8"
    )
    port map (
      I0 => fTdcState_FSM_FFd2_196,
      I1 => fCount(0),
      I2 => fTdcState_FSM_FFd1_192,
      I3 => fTrigEnRisEdge_200,
      I4 => fTrigEnRisEdgeDly_201,
      I5 => fEnableMeas_174,
      O => fCount_mux0000(7)
    );
  fCount_mux0000_0_Q : MUXF7
    port map (
      I0 => N13,
      I1 => N14,
      S => fCount(7),
      O => fCount_mux0000(0)
    );
  fCount_mux0000_0_F : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => fCount(4),
      I1 => fCount(6),
      I2 => fCount(5),
      I3 => N19,
      O => N13
    );
  fCount_mux0000_0_G : LUT5
    generic map(
      INIT => X"F7A2FFAA"
    )
    port map (
      I0 => fTdcState_FSM_FFd1_192,
      I1 => fCount(6),
      I2 => N5,
      I3 => fTdcState_FSM_FFd2_196,
      I4 => fCount(5),
      O => N14
    );
  FasterClk_INV1_INV_0 : INV
    port map (
      I => FasterClk,
      O => N6
    );
  fExtraHalf_mux00001 : LUT6
    generic map(
      INIT => X"FFFBFFFF04000000"
    )
    port map (
      I0 => fTdcState_FSM_FFd1_192,
      I1 => fEnableMeas_174,
      I2 => fIddrQ1dly_181,
      I3 => fIddrQ2Dly_183,
      I4 => fIddrQ1,
      I5 => fExtraHalf_176,
      O => fExtraHalf_mux00001_178
    );
  fExtraHalf_mux00002 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => fExtraHalf_176,
      I1 => fTdcState_FSM_FFd1_192,
      O => fExtraHalf_mux00002_179
    );
  fExtraHalf_mux0000_f7 : MUXF7
    port map (
      I0 => fExtraHalf_mux00002_179,
      I1 => fExtraHalf_mux00001_178,
      S => fTdcState_FSM_FFd2_196,
      O => fExtraHalf_mux0000
    );
  fCount_mux0000_4_1 : LUT3
    generic map(
      INIT => X"A8"
    )
    port map (
      I0 => fCount(3),
      I1 => fTdcState_FSM_FFd1_192,
      I2 => fTdcState_FSM_FFd2_196,
      O => fCount_mux0000_4_1_169
    );
  fCount_mux0000_4_2 : LUT6
    generic map(
      INIT => X"6CCCCCCC28888888"
    )
    port map (
      I0 => fTdcState_FSM_FFd1_192,
      I1 => fCount(3),
      I2 => fCount(1),
      I3 => fCount(0),
      I4 => fCount(2),
      I5 => fTdcState_FSM_FFd2_196,
      O => fCount_mux0000_4_2_170
    );
  fCount_mux0000_4_f7 : MUXF7
    port map (
      I0 => fCount_mux0000_4_2_170,
      I1 => fCount_mux0000_4_1_169,
      S => N181,
      O => fCount_mux0000(4)
    );
  fCount_mux0000_1_1 : LUT6
    generic map(
      INIT => X"EAAAEAAAEAAA4000"
    )
    port map (
      I0 => fCount(6),
      I1 => fCount(5),
      I2 => fCount(4),
      I3 => N19,
      I4 => fTdcState_FSM_FFd1_192,
      I5 => fTdcState_FSM_FFd2_196,
      O => fCount_mux0000_1_1_164
    );
  fCount_mux0000_1_2 : LUT6
    generic map(
      INIT => X"6222EAAA62224000"
    )
    port map (
      I0 => fCount(6),
      I1 => fCount(5),
      I2 => N19,
      I3 => fCount(4),
      I4 => fTdcState_FSM_FFd1_192,
      I5 => fTdcState_FSM_FFd2_196,
      O => fCount_mux0000_1_2_165
    );
  fCount_mux0000_1_f7 : MUXF7
    port map (
      I0 => fCount_mux0000_1_2_165,
      I1 => fCount_mux0000_1_1_164,
      S => N5,
      O => fCount_mux0000(1)
    );
  fTdcState_FSM_FFd1_In1 : LUT4
    generic map(
      INIT => X"8A88"
    )
    port map (
      I0 => fEnableMeas_174,
      I1 => fTdcState_FSM_FFd1_192,
      I2 => fIddrQ1dly_181,
      I3 => fIddrQ1,
      O => fTdcState_FSM_FFd1_In1_194
    );
  fTdcState_FSM_FFd1_In2 : LUT4
    generic map(
      INIT => X"AAA2"
    )
    port map (
      I0 => fTdcState_FSM_FFd1_192,
      I1 => fCountHsReadyBool,
      I2 => fArmCounter_130,
      I3 => fCountHsPush_133,
      O => fTdcState_FSM_FFd1_In2_195
    );
  fTdcState_FSM_FFd1_In_f7 : MUXF7
    port map (
      I0 => fTdcState_FSM_FFd1_In2_195,
      I1 => fTdcState_FSM_FFd1_In1_194,
      S => fTdcState_FSM_FFd2_196,
      O => fTdcState_FSM_FFd1_In
    );

end STRUCTURE;

