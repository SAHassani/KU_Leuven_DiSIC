library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;
  
entity IP_Block is
  generic(
    kMaxFanout    : string := "6");
  port(
    SampleClk 			: in std_logic;
    sdatain 			: in std_logic;
    sdataout 			: out std_logic);
end IP_Block;

architecture rtl of IP_Block is
begin
  EqFanoutFfInstX: entity work.EqFanoutFf (RTL)
  generic map(
    kMaxFanout 			 => kMaxFanout)
  port map(
    SampleClk            => SampleClk,
	sdatain				 => sdatain,
    sdataout 			 => sdataout );
end rtl;