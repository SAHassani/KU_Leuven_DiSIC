library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;
  use work.PkgNiUtilitiesDsp.all;
  use work.PkgDsp.all;
  use work.PkgFractionalDecimator.all;
  
entity FDPB1spc2x1p is
  generic(
    kInputSamplesPerCycle : integer := 1;
    kOverclockFactor : integer := 2;
	kNumProcBlocks : integer := 1);
  port(
    SenOutputFFs : in std_Logic;
    SampleClk : in std_logic;
    OverClk : in std_logic;
    sUserReset : in std_logic;

    sPhaseIncrement : in std_logic_vector(22 downto 0);  -- U23.12
    sCalcCyclesMinusOne : in std_logic_vector(7 downto 0);  --U8.8
    sUseAltCoeff : in std_logic;

    sStartPhaseValid : in std_logic_vector(7 downto 0); -- Boolean [8]
    sStartPhase0 : in std_logic_vector(22 downto 0);  --U23.12

    sDataInValid : in std_logic_vector(3 downto 0); -- Boolean [4]
    sDataInI0 : in std_logic_vector(17 downto 0); -- S18.1
    sDataInQ0 : in std_logic_vector(17 downto 0); -- S18.1
    sReadAddress0 : in std_logic_vector(8 downto 0); -- U9.9

    sAccumOutValid : out std_logic_vector(7 downto 0); -- Boolean [8]
    sAccumOutI0 : out std_logic_vector(44 downto 0);  -- S45.0
    sAccumOutQ0 : out std_logic_vector(44 downto 0));  -- S45.0
end FDPB1spc2x1p;

architecture rtl of FDPB1spc2x1p is
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
    SenOutputFFs         => SenOutputFFs,
    SampleClk            => SampleClk,
    OverClk              => OverClk,
    sUserReset           => sUserReset,

    sPhaseIncrement      => sPhaseIncrement,
    sCalcCyclesMinusOne  => sCalcCyclesMinusOne,

    sStartPhaseValid     => sStartPhaseValid,
    sDataInI0            => sDataInI0,
    sDataInQ0            => sDataInQ0,

	--Disabled signals
    sDataInI1            => zero18,
	sDataInI2            => zero18,
	sDataInI3			 => zero18,
    sDataInQ1            => zero18,
	sDataInQ2            => zero18,
	sDataInQ3			 => zero18,
	
    sDataInValid         => sDataInValid,
	sStartPhase0         => sStartPhase0,
	--Disabled signals
    sStartPhase1          => zero23,	
    sStartPhase2          => zero23,	
	sStartPhase3          => zero23,

	sReadAddress0        => sReadAddress0,
	--Disabled signals
	sReadAddress1        => zero9,
	sReadAddress2        => zero9,
	sReadAddress3        => zero9,
	
    sUseAltCoeff         => sUseAltCoeff,
	--Disabled signals
	sStartPhase4          => zero23,
	sStartPhase5          => zero23,
	sStartPhase6          => zero23,
	sStartPhase7          => zero23,
	sReadAddress4         => zero9,
	sReadAddress5         => zero9,
	sReadAddress6         => zero9,
	sReadAddress7         => zero9,
	
    sAccumOutValid       => sAccumOutValid,
    sAccumOutI0          => sAccumOutI0,
    sAccumOutQ0          => sAccumOutQ0);
end rtl;