library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;
  use work.PkgNiUtilitiesDsp.all;
  use work.PkgDsp.all;
  use work.PkgFractionalDecimator.all;
  
entity FDPB2spc2x2pb is
  generic(
    kInputSamplesPerCycle : integer := 2;
    kOverclockFactor : integer := 2;
	kNumProcBlocks : integer := 2);
  port(
    sUserReset : in std_logic;
	SampleClk : in std_logic;
    OverClk : in std_logic;
    senoutputffs : in std_Logic;

    sPhaseIncrement : in std_logic_vector(22 downto 0);  --U23.12
    sCalcCyclesMinusOne : in std_logic_vector(7 downto 0);  --U8.8
    sUseAltCoeff : in std_logic;

    sStartPhaseValid : in std_logic_vector (7 downto 0); -- Boolean [8]
    sStartPhase0 : in std_logic_vector(22 downto 0);  --U23.12
	sStartPhase1 : in std_logic_vector(22 downto 0);  --U23.12

    sDataInValid : in std_logic_vector(3 downto 0); -- Boolean [4]
    sDataInI0 : in std_logic_vector(17 downto 0); -- S18.1
    sDataInQ0 : in std_logic_vector(17 downto 0); -- S18.1
	sDataInI1 : in std_logic_vector(17 downto 0); -- S18.1
    sDataInQ1 : in std_logic_vector(17 downto 0); -- S18.1

    sReadAddress0: in std_logic_vector(8 downto 0); -- U9.9
    sReadAddress1 : in std_logic_vector(8 downto 0); -- U9.9
	
    sAccumOutValid : out std_logic_vector(7 downto 0); -- Boolean [8]
    sAccumOutI0 : out std_logic_vector(44 downto 0);  -- S45.0
	sAccumOutI1 : out std_logic_vector(44 downto 0);  -- S45.0
    sAccumOutQ0 : out std_logic_vector(44 downto 0);  -- S45.0
	sAccumOutQ1 : out std_logic_vector(44 downto 0));  -- S45.0
end FDPB2spc2x2pb;

architecture rtl of FDPB2spc2x2pb is
  signal zero18 : std_logic_vector(17 downto 0);
  signal zero23 : std_logic_vector(22 downto 0);
  signal zero9  : std_Logic_vector(8 downto 0);
begin
	zero18 <= (others=>'0');
	zero23 <= (others=>'0');
	zero9  <= (others=>'0');
  FractDecProcBlockTopSLVInstX: entity work.FractDecProcBlockTopSLV (RTL)
  generic map(
    kInputSamplesPerCycle => kInputSamplesPerCycle,
    kOverclockFactor      => kOverclockFactor, 
	kNumProcBlocks		  => kNumProcBlocks)
  port map(
    senoutputffs         => senoutputffs,
    SampleClk            => SampleClk,
    OverClk              => OverClk,
    sUserReset           => sUserReset,

    sPhaseIncrement      => sPhaseIncrement,
    sCalcCyclesMinusOne  => sCalcCyclesMinusOne,
    sUseAltCoeff         => sUseAltCoeff,

    sStartPhaseValid      => sStartPhaseValid,
    sStartPhase0          => sStartPhase0,
    sStartPhase1          => sStartPhase1,	
	
	--Disabled signals
	sStartPhase2          => zero23,	
	sStartPhase3          => zero23,

    sDataInValid         => sDataInValid,
    sDataInI0            => sDataInI0,
    sDataInQ0            => sDataInQ0,
	sDataInI1            => sDataInI1,
    sDataInQ1            => sDataInQ1,
	--Disabled signals
	sDataInI2            => zero18,
	sDataInI3			 => zero18,
	sDataInQ2            => zero18,
	sDataInQ3			 => zero18,
	
    sReadAddress0         => sReadAddress0,
	sReadAddress1         => sReadAddress1,
	--Disabled signals
	sReadAddress2        => zero9,
	sReadAddress3        => zero9,
	sStartPhase4          => zero23,
	sStartPhase5          => zero23,
	sStartPhase6          => zero23,
	sStartPhase7          => zero23,
	sReadAddress4         => zero9,
	sReadAddress5         => zero9,
	sReadAddress6         => zero9,
	sReadAddress7         => zero9,
	
    sAccumOutValid       => sAccumOutValid,
    sAccumOutI0           => sAccumOutI0,
    sAccumOutQ0           => sAccumOutQ0,
    sAccumOutI1           => sAccumOutI1,
    sAccumOutQ1           => sAccumOutQ1);
end rtl;