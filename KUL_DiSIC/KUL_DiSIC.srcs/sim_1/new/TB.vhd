----------------------------------------------------------------------------------
-- Author: KU Leuven, ESAT, Networked Systems Group  
-- Contact person:
--                 Seyed Ali Hassani            seyedali.hassani@kuleuven.be
--                 Sofie Pollin                 sofie.pollin@esat.kuleuven.be
-- Create Date: 09/27/2019 01:28:26 PM
-- Design Name: Digital Self-interference Canceller
-- Module Name: TB - Behavioral 
-- Target Devices: Xilinx Kintex7 
-- Tool Versions: Vivado 2018.3
-- Revision: V 1.0
-- Copyright:
----------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;
use std.textio.all;
use work.fixed_pkg.all;
use work.KUL_pkg.all;

entity TB is
--  Port ( );
end TB;

architecture Behavioral of TB is

-- Select the test file 
constant TestFile : string:= "../../../../TestData/SimulatedData.txt";
--constant TestFile : string:= "../../../../TestData/IEEE802_11_p.txt";
-- *********************
constant CLK_cyc :time := 17 ns;
signal Update_Sample: STD_LOGIC_VECTOR (15 downto 0):= x"0008";
signal mu : sfixed(0 downto N_Frac+1):=to_sfixed(0.01,0,N_Frac+1);
signal CLK : std_logic;
signal Rst : std_logic:='1';
signal Valid_in : std_logic:='0';
signal Valid_out : std_logic:='0';
signal Rdy : std_logic:='0';
signal Ref_I :  STD_LOGIC_VECTOR (N_bit-1 downto 0):=(others=>'0');
signal Ref_Q :  STD_LOGIC_VECTOR (N_bit-1 downto 0):=(others=>'0');
signal Rec_I :  STD_LOGIC_VECTOR (N_bit-1 downto 0):=(others=>'0');
signal Rec_Q :  STD_LOGIC_VECTOR (N_bit-1 downto 0):=(others=>'0');
signal Y_I :  STD_LOGIC_VECTOR (N_bit-1  downto 0):=(others=>'0');
signal Y_Q :  STD_LOGIC_VECTOR (N_bit-1  downto 0):=(others=>'0');
signal E_I :  STD_LOGIC_VECTOR (N_bit-1  downto 0):=(others=>'0');
signal E_Q :  STD_LOGIC_VECTOR (N_bit-1  downto 0):=(others=>'0');
signal mu_in :  STD_LOGIC_VECTOR (-N_Frac-1 downto 0);
signal Update_coff :STD_LOGIC;
--signal Test_Cnt :  STD_LOGIC_VECTOR (N_bit+N_Taps-1  downto 0):=(others=>'0');


component TOP
--    generic (Max_element_sum : integer := 5 -- # Max number of elements to be added each time
--             );  
    Port ( CLK : in STD_LOGIC;             
           Valid_In : in STD_LOGIC;         
           Valid_Out : out STD_LOGIC;         
           RST : in STD_LOGIC;              
           Rdy : out STD_LOGIC;            
           Ref_I : in STD_LOGIC_VECTOR (N_bit-1 downto 0);    
           Ref_Q : in STD_LOGIC_VECTOR (N_bit-1 downto 0);    
           Rec_I : in STD_LOGIC_VECTOR (N_bit-1 downto 0);    
           Rec_Q : in STD_LOGIC_VECTOR (N_bit-1 downto 0); 
           Y_I : out STD_LOGIC_VECTOR (N_bit-1 downto 0);  
           Y_Q : out STD_LOGIC_VECTOR (N_bit-1 downto 0);  
           E_I : out STD_LOGIC_VECTOR (N_bit-1 downto 0);  
           E_Q : out STD_LOGIC_VECTOR (N_bit-1 downto 0);  
           mu_in : in STD_LOGIC_VECTOR (-N_Frac-1 downto 0);
           Update_coff : in STD_LOGIC;
           Update_Sample : in STD_LOGIC_VECTOR (15 downto 0)
           );
end component;

begin


m_TOP : TOP port map(
CLK => CLK,
Valid_in => Valid_in,
Valid_Out=> Valid_out,
Rst => Rst,
Rdy => Rdy,
Ref_I => Ref_I,
Ref_Q => Ref_Q,
Rec_I => Rec_I,
Rec_Q => Rec_Q,
Y_I => Y_I,
Y_Q => Y_Q,
E_I => E_I,
E_Q => E_Q,
mu_in => mu_in,
Update_coff => Update_coff,
Update_Sample => Update_Sample
);

mu_in <= std_logic_vector(mu);               
  
    
process
begin
    -- Reset mechanism at sturt up
    if (RST = '1') then
        Valid_in <= '0';
        CLK <= '0';
        wait for CLK_cyc;
        CLK <= '1';
        wait for CLK_cyc;
        CLK <= '0';
        wait for CLK_cyc;
        RST <= '0';
        Update_coff <= '0';
    else
    Update_coff <= '1';
    RST <= '0';
    CLK <= '1';
-- Test scripts ********************************  
--    if Test_Cnt > 2000 then
--        Test_Cnt <= (others =>'0');
--        RST <= '1';
--        Valid_in <= '0';
--    else
--        Test_Cnt <= Test_Cnt +1;
--        Valid_in <= '1';
--    end if;
-- *********************************************
    Valid_in <= '1';    
    wait for CLK_cyc;
    CLK <= '0';
    wait for CLK_cyc;
end if;
end process;

process(CLK)
file file_ID :text open read_mode is TestFile;
variable row          : line;
variable v_data_read  : integer range -(2**(16-1)) to (2**(16-1))-1:=0;
begin
    if falling_edge(CLK) then
        if (endfile(file_ID)) then
            file_close(file_ID);
            file_open(file_ID, TestFile,read_mode);
        else
    -- Test scripts ********************************    
    --        Ref_I <=  Ref_I + x"0001"; --
    --        Ref_Q <=  Ref_Q + x"0002"; --
    --        Rec_I <=  Rec_I + x"0014"; --
    --        Rec_Q <=  Rec_Q + x"0014"; --
    -- *********************************************
            readline(file_ID, row);
            read(row, v_data_read);
            Ref_I <= std_logic_vector(to_signed(v_data_read,16));
            readline(file_ID, row);
            read(row, v_data_read);
            Ref_Q <= std_logic_vector(to_signed(v_data_read,16));
            readline(file_ID, row);
            read(row, v_data_read);
            Rec_I <= std_logic_vector(to_signed(v_data_read,16));
            readline(file_ID, row);
            read(row, v_data_read);
            Rec_Q <= std_logic_vector(to_signed(v_data_read,16));
        end if;
   end if;
end process;

end Behavioral;