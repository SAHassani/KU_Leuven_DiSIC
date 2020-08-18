library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;
  use work.PkgNiUtilitiesDsp.all;
  use work.PkgDsp.all;
  use work.PkgFractInterp.all;
  
entity FIPB1spc2x is
  generic(
    kSamplesPerCycle : integer := 1;
    kOverclockFactor : integer := 2);
  port(
    senoutputffs : in std_Logic;
    SampleClk : in std_logic;
    OverClk : in std_logic;

    sCalcEnableIn : in std_logic;
    sPhaseIn0  : in std_logic_vector(28 downto 0); -- S29.8

    sDataInValid : in std_logic;
    sDataInI0 : in std_logic_vector(17 downto 0); -- S18.1
    sDataInQ0 : in std_logic_vector(17 downto 0); -- S18.1

    sAccumOutValid : out std_logic;
    sAccumOutI0 : out std_logic_vector(45 downto 0);  -- S46.7
    sAccumOutQ0 : out std_logic_vector(45 downto 0));  -- S46.7
end FIPB1spc2x;

architecture rtl of FIPB1spc2x is
  signal zeros : std_logic_vector(1 downto 0);
  signal zero29 : std_logic_vector(28 downto 0);
  signal zero18 : std_logic_vector(17 downto 0);
begin
	zeros <= (others=>'0');
	zero29 <= (others=>'0');
	zero18 <= (others=>'0');
  FractInterpProcBlockTopSLVInstX: entity work.FractInterpProcBlockTopSLV (RTL)
  generic map(
    kSamplesPerCycle => kSamplesPerCycle,
    kOverclockFactor => kOverclockFactor)
  port map(
    senoutputffs         => senoutputffs,
    SampleClk            => SampleClk,
    OverClk              => OverClk,

    sCalcEnableIn        => sCalcEnableIn,
    sPhaseIn0            => sPhaseIn0,
	sPhaseIn1 			 => zero29,
 	
    sDataInValid         => sDataInValid,
    sDataInI0            => sDataInI0,
    sDataInQ0            => sDataInQ0,
    sDataInI1            => zero18,
    sDataInQ1            => zero18,	
	
	sDataReadAddressOffset0 	 => zeros,
	sDataReadAddressOffset1		 => zeros,	
	
    sAccumOutValid       => sAccumOutValid,
    sAccumOutI0          => sAccumOutI0,
    sAccumOutQ0          => sAccumOutQ0);
end rtl;