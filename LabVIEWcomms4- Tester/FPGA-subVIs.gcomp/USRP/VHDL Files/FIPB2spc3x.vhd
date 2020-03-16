library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;
  use work.PkgNiUtilitiesDsp.all;
  use work.PkgDsp.all;
  use work.PkgFractInterp.all;
  
entity FIPB2spc3x is
  generic(
    kSamplesPerCycle : integer := 2;
    kOverclockFactor : integer := 3);
  port(
    senoutputffs : in std_Logic;
    SampleClk : in std_logic;
    OverClk : in std_logic;

    sCalcEnableIn : in std_logic;
    sPhaseIn0  : in std_logic_vector(28 downto 0); -- S29.8
	sPhaseIn1  : in std_logic_vector(28 downto 0); -- S29.8
	
	sDataReadAddressOffset0 : in std_logic_vector(1 downto 0); -- S2.2
	sDataReadAddressOffset1 : in std_logic_vector(1 downto 0); -- S2.2

    sDataInValid : in std_logic;
    sDataInI0 : in std_logic_vector(17 downto 0); -- S18.1
    sDataInQ0 : in std_logic_vector(17 downto 0); -- S18.1
	sDataInI1 : in std_logic_vector(17 downto 0); -- S18.1
    sDataInQ1 : in std_logic_vector(17 downto 0); -- S18.1

    sAccumOutValid : out std_logic;
    sAccumOutI0 : out std_logic_vector(45 downto 0);  -- S46.7
    sAccumOutQ0 : out std_logic_vector(45 downto 0);  -- S46.7
	sAccumOutI1 : out std_logic_vector(45 downto 0);  -- S46.7
    sAccumOutQ1 : out std_logic_vector(45 downto 0));  -- S46.7
end FIPB2spc3x;

architecture rtl of FIPB2spc3x is
begin
  FractInterpProcBlockTopSLVInstX: entity work.FractInterpProcBlockTopSLV (RTL)
  generic map(
    kSamplesPerCycle => kSamplesPerCycle,
    kOverclockFactor => kOverclockFactor)
  port map(
    senoutputffs         => senoutputffs,
    SampleClk            => SampleClk,
    OverClk              => OverClk,
	
    sPhaseIn0            => sPhaseIn0,
	sPhaseIn1 			 => sPhaseIn1,
    sCalcEnableIn        => sCalcEnableIn,
	
	sDataReadAddressOffset0 	 => sDataReadAddressOffset0,
	sDataReadAddressOffset1		 => sDataReadAddressOffset1,	

    sDataInI0            => sDataInI0,
    sDataInQ0            => sDataInQ0,
    sDataInI1            => sDataInI1,
    sDataInQ1            => sDataInQ1,	
	
    sDataInValid         => sDataInValid,
    sAccumOutValid       => sAccumOutValid,
    sAccumOutI0          => sAccumOutI0,
	sAccumOutI1          => sAccumOutI1,
	sAccumOutQ0          => sAccumOutQ0,
    sAccumOutQ1          => sAccumOutQ1);
end rtl;