library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;
  use work.PkgNiUtilitiesDsp.all;
  use work.PkgDsp.all;
  
entity FIRFilter_2spc is
  generic(
    kCoefWidth    : integer := 18;
    kDataWidth    : integer := 18;
	kOutputWidth  : integer := 31;
	kNumMacPerSeg : integer := 8;
	kSpc 		  : integer:= 2;
	kOverclock 	  : integer := 3);
  port(
    sDisableOutputFf 	: in std_Logic;
    SampleClk 			: in std_logic;
    SampleClkNx 		: in std_logic;

    sDataIn0  			: in std_logic_vector(17 downto 0); -- S18.1
    sDataIn1  			: in std_logic_vector(17 downto 0); -- S18.1
    sCoefLoad 			: in std_logic;
    sCoefWe   			: in std_logic;
	
	sCoefDin 			: in std_logic_vector(17 downto 0); -- S18.1
	
    sdatavalidin 		: in std_logic;
    sdataout0 			: out std_logic_vector(30 downto 0);  -- S???
    sdataout1 			: out std_logic_vector(30 downto 0);  -- S???
	sdatavalidout		: out std_Logic);

end FIRFilter_2spc;

architecture rtl of FIRFilter_2spc is
  signal zero18 : std_logic_vector(17 downto 0);
begin
	zero18 <= (others=>'0');
  EqSingleFilterInstX: entity work.EqSingleFilter (RTL)
  generic map(
    kCoefWidth 			 => kCoefWidth,
    kDataWidth      	 => kDataWidth,
	kOutputWidth	  	 => kOutputWidth,
	kSpc				 => kSpc,
	kOverclock		  	 => kOverclock)
  port map(
    sDisableOutputFf     => sDisableOutputFf,
    SampleClk            => SampleClk,
    SampleClkNx          => SampleClkNx,
    sDataIn0  			 => sDataIn0,
    sDataIn1  			 => sDataIn1,
    sCoefLoad 			 => sCoefLoad,
    sCoefWe   			 => sCoefWe,
	
	sCoefDin 			 => sCoefDin,
	
    sdatavalidin 		 => sdatavalidin,
	-- disabled inputs
    sDataIn2  			 => zero18,
    sDataIn3  			 => zero18,
    sDataIn4  			 => zero18,
    sDataIn5  			 => zero18,
    sDataIn6  			 => zero18,
    sDataIn7  			 => zero18,	
    sDataIn8  			 => zero18,
    sDataIn9  			 => zero18,
    sDataIn10 			 => zero18,
    sDataIn11 			 => zero18,
    sDataIn12			 => zero18,
    sDataIn13 			 => zero18,
    sDataIn14			 => zero18,
    sDataIn15 			 => zero18,		
	
    sdataout0 			 => sdataout0,
    sdataout1 			 => sdataout1,
	sdatavalidout	 	 => sdatavalidout);
end rtl;