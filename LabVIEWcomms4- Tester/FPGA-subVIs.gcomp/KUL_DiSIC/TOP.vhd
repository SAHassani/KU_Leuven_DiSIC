----------------------------------------------------------------------------------
-- Author: KU Leuven, ESAT, Networked Systems Group  
-- Create Date: 09/27/2019 01:28:26 PM
-- Design Name: Digital Self-interference Canceller
-- Module Name: Top HDL - Behavioral 
-- Target Devices: Xilinx Kintex7 
-- Tool Versions: Vivado 2018.3
-- Revision: V 1.0
-- License & copyright:
-- © Networked Systems Group, ESAT, KU Leuven, Belgium.
-- Licensed under MIT License.
-- Contact person:
--                 Seyed Ali Hassani            seyedali.hassani@kuleuven.be
--                 Sofie Pollin                 sofie.pollin@esat.kuleuven.be  
----------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all; 
use IEEE.std_logic_unsigned.all;
use work.fixed_pkg.all;
use work.KUL_pkg.all;
--use work.example_package.all;
--library ieee_proposed;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TOP is
--    generic (
--             );  
    Port ( CLK : in STD_LOGIC;             							-- Main CLK: Must be few kHz larger than the samplerate
           Valid_In : in STD_LOGIC;         						-- Data In valid 
           Valid_Out : out STD_LOGIC;       						-- Data Out valid   
           RST : in STD_LOGIC;              						-- Reset 
           Rdy : out STD_LOGIC;             						-- Rdy to get new sample (Not used!)
           Ref_I : in STD_LOGIC_VECTOR (N_bit-1 downto 0);    		-- Reference signal, Tx_I
           Ref_Q : in STD_LOGIC_VECTOR (N_bit-1 downto 0);    		-- Reference signal, Tx_Q
           Rec_I : in STD_LOGIC_VECTOR (N_bit-1 downto 0);    		-- Received signal, Rx_I
           Rec_Q : in STD_LOGIC_VECTOR (N_bit-1 downto 0);    		-- Received signal, Rx_Q
           Y_I : out STD_LOGIC_VECTOR (N_bit-1 downto 0);         	-- Estimated compensation signal, I
           Y_Q : out STD_LOGIC_VECTOR (N_bit-1 downto 0);         	-- Estimated compensation signal, Q
           E_I : out STD_LOGIC_VECTOR (N_bit-1 downto 0); 			-- Interfernce-free signal, I
           E_Q : out STD_LOGIC_VECTOR (N_bit-1 downto 0); 			-- Interfernce-free signal, Q
           mu_in : in STD_LOGIC_VECTOR (-N_Frac-1 downto 0);		-- Convergance factor
           Update_coff : in STD_LOGIC;
           Update_Sample : in STD_LOGIC_VECTOR (15 downto 0)
           );
end TOP;

architecture Behavioral of TOP is
-- Interfacing signal
signal Ref_I_fix : sfixed(N_bit-1 downto 0):=(others =>'0');
signal Ref_Q_fix : sfixed(N_bit-1 downto 0):=(others =>'0');
signal Ref_I_fix_1d : sfixed(N_bit-1 downto 0):=(others =>'0');
signal Ref_Q_fix_1d : sfixed(N_bit-1 downto 0):=(others =>'0');
signal Ref_I_fix_2d : sfixed(N_bit-1 downto 0):=(others =>'0');
signal Ref_Q_fix_2d : sfixed(N_bit-1 downto 0):=(others =>'0');
signal Ref_I_fix_3d : sfixed(N_bit-1 downto 0):=(others =>'0');
signal Ref_Q_fix_3d : sfixed(N_bit-1 downto 0):=(others =>'0');
signal Ref_I_fix_4d : sfixed(N_bit-1 downto 0):=(others =>'0');
signal Ref_Q_fix_4d : sfixed(N_bit-1 downto 0):=(others =>'0');
signal Ref_I_fix_last_d : sfixed(N_bit-1 downto 0):=(others =>'0');
signal Ref_Q_fix_last_d : sfixed(N_bit-1 downto 0):=(others =>'0');


signal Rec_I_fix : sfixed(N_bit-1 downto 0):=(others =>'0');
signal Rec_Q_fix : sfixed(N_bit-1 downto 0):=(others =>'0');
signal Rec_I_fix_1d : sfixed(N_bit-1 downto 0):=(others =>'0');
signal Rec_Q_fix_1d : sfixed(N_bit-1 downto 0):=(others =>'0');
signal Rec_I_fix_2d : sfixed(N_bit-1 downto 0):=(others =>'0');
signal Rec_Q_fix_2d : sfixed(N_bit-1 downto 0):=(others =>'0');
signal Rec_I_fix_3d : sfixed(N_bit-1 downto 0):=(others =>'0');
signal Rec_Q_fix_3d : sfixed(N_bit-1 downto 0):=(others =>'0');
signal Rec_I_fix_4d : sfixed(N_bit-1 downto 0):=(others =>'0');
signal Rec_Q_fix_4d : sfixed(N_bit-1 downto 0):=(others =>'0');
signal Rec_I_fix_last_d : sfixed(N_bit-1 downto 0):=(others =>'0');
signal Rec_Q_fix_last_d : sfixed(N_bit-1 downto 0):=(others =>'0');
signal W_Vector_Rdy: STD_LOGIC:='0'; 
-- UU is the reference vector 
signal UU_I : ARRAY_TYPE_Int;
signal UU_Q : ARRAY_TYPE_Int;
signal UU_I_1d : ARRAY_TYPE_Int;
signal UU_Q_1d : ARRAY_TYPE_Int;
signal UU_I_2d : ARRAY_TYPE_Int;
signal UU_Q_2d : ARRAY_TYPE_Int;
signal UU_I_3d : ARRAY_TYPE_Int;
signal UU_Q_3d : ARRAY_TYPE_Int;
signal UU_I_4d : ARRAY_TYPE_Int;
signal UU_Q_4d : ARRAY_TYPE_Int;
signal UU_I_last_d : ARRAY_TYPE_Int;
signal UU_Q_last_d : ARRAY_TYPE_Int;
signal UU_I_for_update_w : ARRAY_TYPE_Int;
signal UU_Q_for_update_w : ARRAY_TYPE_Int;

-- W is the weight vector
signal W_I : ARRAY_TYPE_Frac;
signal W_Q : ARRAY_TYPE_Frac;


-- Signals for complex mathematic operations
signal I_A : ARRAY_TYPE_Fixed;
signal I_B : ARRAY_TYPE_Fixed;
signal Q_A : ARRAY_TYPE_Fixed;
signal Q_B : ARRAY_TYPE_Fixed;

signal I_AB : ARRAY_TYPE_Fixed;
signal Q_AB : ARRAY_TYPE_Fixed;

-- Signals for filter output estimation
signal I_AB_semi_sum : ARRAY_TYPE_Fixed;   
signal Q_AB_semi_sum : ARRAY_TYPE_Fixed;
signal I_AB_semi2_sum : ARRAY_TYPE_Fixed;   
signal Q_AB_semi2_sum : ARRAY_TYPE_Fixed;

-- 
signal Sum_I_for_error : sfixed(N_bit-1 downto 0):=(others =>'0');    
signal Sum_Q_for_error : sfixed(N_bit-1 downto 0):=(others =>'0');    

signal E_I_for_update : sfixed(N_bit-1 downto 0):=(others =>'0');
signal E_Q_for_update : sfixed(N_bit-1 downto 0):=(others =>'0');

-- Control/configuration signals
signal Update_timer : integer range 0 to (2**15)-1:=0;
signal ScaleFactor : integer range 0 to (2**7)-1:=0;
signal W_Update_Start : boolean:= False;
signal mu : sfixed(0 downto N_Frac+1):=to_sfixed(0.0000001,0,N_Frac+1);

type STATE is (Reset, GetNewSample, Sum_AB, Sum_uu, Shift_uu);
type STATE_update is (Comput_eu_AB,Comput_eu,Comput_eumu,Comput_Add,Update_W);


begin



-- Conversion to fix point
Ref_I_fix <= to_sfixed(Ref_I,N_bit-1,0);
Ref_Q_fix <= to_sfixed(Ref_Q,N_bit-1,0);
Rec_I_fix <= to_sfixed(Rec_I,N_bit-1,0);
Rec_Q_fix <= to_sfixed(Rec_Q,N_bit-1,0);
mu <= to_sfixed(mu_in,0,N_Frac+1);

-- This process makes required delay for pipelining processing  
process(CLK)
begin
      if rising_edge(CLK) then
        if RST = '1' then
            for i in 0 to N_Taps-1 loop				-- Reset the reference vector
                UU_I_1d(i) <= (others=>'0');
                UU_Q_1d(i) <= (others=>'0');
                UU_I_2d(i)<= (others=>'0');
                UU_Q_2d(i)<= (others=>'0');
                UU_I_3d(i)<= (others=>'0');
                UU_Q_3d(i)<= (others=>'0');
                UU_I_4d(i)<= (others=>'0');
                UU_Q_4d(i)<= (others=>'0');
                UU_I_last_d(i)<= (others=>'0');
                UU_Q_last_d(i)<= (others=>'0');
            end loop;
			-- Reset the pipeline buffers
			
			Ref_I_fix_1d <= (others=>'0');
            Ref_Q_fix_1d <= (others=>'0');
            Ref_I_fix_2d <= (others=>'0');
            Ref_Q_fix_2d <= (others=>'0');
            Ref_I_fix_3d <= (others=>'0');
            Ref_Q_fix_3d <= (others=>'0');
            Ref_I_fix_4d <= (others=>'0');
            Ref_Q_fix_4d <= (others=>'0');
            Ref_I_fix_last_d <= (others=>'0');
            Ref_Q_fix_last_d <= (others=>'0');   
			
			
            Rec_I_fix_1d <= (others=>'0');
            Rec_Q_fix_1d <= (others=>'0');
            Rec_I_fix_2d <= (others=>'0');
            Rec_Q_fix_2d <= (others=>'0');
            Rec_I_fix_3d <= (others=>'0');
            Rec_Q_fix_3d <= (others=>'0');
            Rec_I_fix_4d <= (others=>'0');
            Rec_Q_fix_4d <= (others=>'0');
            Rec_I_fix_last_d <= (others=>'0');
            Rec_Q_fix_last_d <= (others=>'0');           
        else
			
            if Valid_In = '1' then
				-- Sampling
                UU_I_1d(0) <= Ref_I_fix;
                UU_Q_1d(0) <= Ref_Q_fix;
				-- Update the reference vector
                for i in 1 to N_Taps-1 loop
                    UU_I_1d(i) <= UU_I(i);
                    UU_Q_1d(i) <= UU_Q(i);
                end loop;
                -- Pipeline mechanism, reference vector
                UU_I_2d<=UU_I_1d;
                UU_Q_2d<=UU_Q_1d;
                UU_I_3d<=UU_I_2d;
                UU_Q_3d<=UU_Q_2d;
                UU_I_4d<=UU_I_3d;
                UU_Q_4d<=UU_Q_3d;
                UU_I_last_d<=UU_I_4d;
                UU_Q_last_d<=UU_Q_4d;
				
                -- Pipeline mechanism, Received signal
                
                Ref_I_fix_1d <= Ref_I_fix;
                Ref_Q_fix_1d <= Ref_Q_fix; 			
                Ref_I_fix_2d <= Ref_I_fix_1d;
                Ref_Q_fix_2d <= Ref_Q_fix_1d;
                Ref_I_fix_3d <= Ref_I_fix_2d;
                Ref_Q_fix_3d <= Ref_Q_fix_2d;
                Ref_I_fix_4d <= Ref_I_fix_3d;
                Ref_Q_fix_4d <= Ref_Q_fix_3d;
                Ref_I_fix_last_d <= Ref_I_fix_4d;
                Ref_Q_fix_last_d <= Ref_Q_fix_4d;
                
                
                
                Rec_I_fix_1d <= Rec_I_fix;
                Rec_Q_fix_1d <= Rec_Q_fix; 			
                Rec_I_fix_2d <= Rec_I_fix_1d;
                Rec_Q_fix_2d <= Rec_Q_fix_1d;
                Rec_I_fix_3d <= Rec_I_fix_2d;
                Rec_Q_fix_3d <= Rec_Q_fix_2d;
                Rec_I_fix_4d <= Rec_I_fix_3d;
                Rec_Q_fix_4d <= Rec_Q_fix_3d;
                Rec_I_fix_last_d <= Rec_I_fix_4d;
                Rec_Q_fix_last_d <= Rec_Q_fix_4d;
                
            end if;        
      end if;
  end if;    
end process;


-- Complex multiplication: (a1+jb1)(a2+jb2) = (a1b1-a2b2)+j(a1b2+a2b1)
-- This process computes I_A=a1b1, I_B=a2b2, Q_A=a1b2 and Q_B=a2b1
process(CLK)
begin
      if rising_edge(CLK) then
        if RST = '1' then                   -- Reset the DiSIC module
           for i in 0 to N_Taps-1 loop
                UU_I(i) <= (others=>'0');
                UU_Q(i) <= (others=>'0');
                I_A(i) <= (others=>'0');
                I_B(i) <= (others=>'0');
                Q_A(i) <= (others=>'0');
                Q_B(i) <= (others=>'0');
           end loop;        
           Rdy <= '0';
        else
            if Valid_In = '1' then
                -- For the first index of the reference vector
                I_A(0) <= Mul_Int_Frac(Ref_I_fix, W_I(0));
                I_B(0) <= Mul_Int_Frac(Ref_Q_fix, W_Q(0));
                Q_A(0) <= Mul_Int_Frac(Ref_I_fix, W_Q(0));
                Q_B(0) <= Mul_Int_Frac(Ref_Q_fix, W_I(0));
                -- The other indexes of the reference vector
                for i in 1 to N_Taps-1 loop 
                    I_A(i) <= Mul_Int_Frac(UU_I(i), W_I(i));
                    I_B(i) <= Mul_Int_Frac(UU_Q(i), W_Q(i));
                    Q_A(i) <= Mul_Int_Frac(UU_I(i), W_Q(i));
                    Q_B(i) <= Mul_Int_Frac(UU_Q(i), W_I(i));
                end loop;
                -- Shift the reference vector
                UU_I(1) <= Ref_I_fix;
                UU_Q(1) <= Ref_Q_fix;
                for i in 1 to N_Taps-2 loop
                   UU_I(i+1) <= UU_I(i);
                   UU_Q(i+1) <= UU_Q(i);
                end loop;     	
            end if;     
        end if;
     end if; 
end process;

-- Complex multiplication: (a1+jb1)(a2+jb2) = (a1b1-a2b2)+j(a1b2+a2b1)
-- This process computes I_AB = I_A - I_B = a1b1-a2b2  AND  Q_AB = Q_A + Q_B = a2b2+a2b1
process(CLK)
begin
    if rising_edge(CLK) then
        if RST = '1' then  						
           for i in 0 to N_Taps-1 loop
                I_AB(i) <= (others=>'0');
                Q_AB(i) <= (others=>'0');
           end loop;         
           Rdy <= '0';
        else 
			if Valid_In = '1' then
				for i in 0 to N_Taps-1 loop
				    I_AB(i) <= Sum_Fixed(I_A(i),-I_B(i));
				    Q_AB(i) <= Sum_Fixed(Q_A(i), Q_B(i)); 
				end loop;
			end if; 
		end if;
	end if;
end process;


-- Filter output, Step 1 
process(CLK)
variable I_Temp : ARRAY_TYPE_Fixed;   
variable Q_Temp : ARRAY_TYPE_Fixed;
begin
    if rising_edge(CLK) then
        if RST = '1' then                   
           for i in 0 to Add_Strid1 loop
                I_AB_semi_sum(i)<= (others=>'0');
                Q_AB_semi_sum(i)<= (others=>'0');
           end loop;         
           Rdy <= '0';          
        else 
			if Valid_In = '1' then
				for i in 0 to Add_Strid1 loop
				    I_Temp(i) := (others=>'0');
				    Q_Temp(i) := (others=>'0');
				    for j in 0 to Add_Step1-1 loop
					   I_Temp(i) := Sum_Fixed(I_Temp(i), I_AB((i*Add_Step1)+j));
					   Q_Temp(i) := Sum_Fixed(Q_Temp(i), Q_AB((i*Add_Step1)+j));
					end loop;
					I_AB_semi_sum(i) <= I_Temp(i);
 					Q_AB_semi_sum(i) <= Q_Temp(i);
				end loop;
			end if; 
		end if;
	end if;
end process;


-- Filter output, Step 2 
process(CLK)
variable I_Temp : ARRAY_TYPE_Fixed;   
variable Q_Temp : ARRAY_TYPE_Fixed;
begin
    if rising_edge(CLK) then
        if RST = '1' then                   
           for i in 0 to Add_Strid2 loop
                I_AB_semi2_sum(i)<= (others=>'0');
                Q_AB_semi2_sum(i)<= (others=>'0');
           end loop;         
           Rdy <= '0';          
        else 
			if Valid_In = '1' then
				for i in 0 to Add_Strid2 loop
				    I_Temp(i) := (others=>'0');
				    Q_Temp(i) := (others=>'0');
				    for j in 0 to Add_Step2-1 loop
					   I_Temp(i) := Sum_Fixed(I_Temp(i), I_AB_semi_sum((i*Add_Step2)+j));
					   Q_Temp(i) := Sum_Fixed(Q_Temp(i), Q_AB_semi_sum((i*Add_Step2)+j));
					end loop;
					I_AB_semi2_sum(i) <= I_Temp(i);
					Q_AB_semi2_sum(i) <= Q_Temp(i);
				end loop;
			end if; 
		end if;
	end if;
end process;




-- Filter output, Step 2 
process(CLK)
variable I_Temp : sfixed(N_bit-1 downto N_Frac):=(others =>'0');    
variable Q_Temp : sfixed(N_bit-1 downto N_Frac):=(others =>'0');   
begin
    if rising_edge(CLK) then
        if RST = '1' then                          
           Rdy <= '0';
		   I_Temp :=(others=>'0');
		   Q_Temp := (others=>'0');
		   Sum_I_for_error <= (others=>'0');
		   Sum_Q_for_error <= (others=>'0');
        else 
			if Valid_In = '1' then
				I_Temp := (others=>'0');
				Q_Temp := (others=>'0');
				for i in 0 to Add_Step3-1 loop
					I_Temp := Sum_Fixed(I_Temp , I_AB_semi2_sum(i));                   
					Q_Temp := Sum_Fixed(Q_Temp , Q_AB_semi2_sum(i));
				end loop;
				Sum_I_for_error <= Round_Fixed(I_Temp);
				Sum_Q_for_error <= Round_Fixed(Q_Temp);
			end if; 
		end if;
	end if;
end process;


-- This process estimates error and trig the LMS algorithm to update coefficients vector W
process(CLK)
variable Error_I: sfixed(N_bit-1 downto 0);
variable Error_Q: sfixed(N_bit-1 downto 0);
begin
    if rising_edge(CLK) then
        if RST = '1' then                   -- Reset the DiSIC module
			Y_I <= (others =>'0');
			Y_Q <= (others =>'0');
			for i in 0 to N_Taps-1 loop
			   UU_I_for_update_w(i) <= (others =>'0'); 
			   UU_Q_for_update_w(i) <= (others =>'0');
			end loop;
			Update_timer <= 0;
			W_Update_Start <= False;
			E_I_for_update <= (others =>'0');
			E_Q_for_update <= (others =>'0');
			if Valid_In = '1' then
			     E_I <= Rec_I;
			     E_Q <= Rec_Q;
			     Valid_Out <= '1';
			else
			     Valid_Out <= '0';
			end if;
        else 
			if Valid_In = '1' then
				Valid_Out <= '1';
                Y_I <= std_logic_vector(to_signed(Sum_I_for_error,Y_I'length)); 
                Y_Q <= std_logic_vector(to_signed(Sum_Q_for_error,Y_Q'length));
                Error_I := Sum_Int(Rec_I_fix_last_d, -Sum_I_for_error);
                Error_Q := Sum_Int(Rec_Q_fix_last_d, -Sum_Q_for_error); 
                E_I <=  std_logic_vector(to_signed(Error_I,Error_I'length));
                E_Q <=  std_logic_vector(to_signed(Error_Q,Error_Q'length));              
                -- collect data for update the coefficients
                if (Update_timer + 1) <= to_integer(unsigned(Update_Sample))  then 
                     Update_timer <= Update_timer + 1;
                     W_Update_Start <= False;
                else
                     Update_timer <= 0;
                     E_I_for_update <= Error_I;
                     E_Q_for_update <= Error_Q;
                     UU_I_for_update_w <= UU_I_last_d;
                     UU_Q_for_update_w <= UU_Q_last_d;
                     if Update_coff ='1' then 
                        W_Update_Start <= True;
                     end if;         
                end if;
			else
				Valid_Out <= '0';
			end if; 
		end if;
	end if;
end process;




-- Process for updating the coefficients vector W
-- w[n+1] = w[n] + e[n] * conj(uu[n]) * mu
process(CLK)
variable W_I_temp : ARRAY_TYPE_Frac;
variable W_Q_temp : ARRAY_TYPE_Frac;
variable eu_mu_I : ARRAY_TYPE_Frac;
variable eu_mu_Q : ARRAY_TYPE_Frac;
variable m_STATE : STATE_Update:= Comput_eu_AB;
variable eu_I_A :ARRAY_TYPE_Long;
variable eu_I_B :ARRAY_TYPE_Long;
variable eu_Q_A :ARRAY_TYPE_Long;
variable eu_Q_B :ARRAY_TYPE_Long;
variable eu_I :ARRAY_TYPE_Long;
variable eu_Q :ARRAY_TYPE_Long;
variable temp:sfixed(2*N_bit-1 downto N_Frac);
begin
if rising_edge(CLK) then
    if RST = '1' then
      for i in 0 to N_Taps-1 loop
                W_I(i) <= (others=>'0');
                W_Q(i) <= (others=>'0');
      end loop;
      m_STATE := Comput_eu_AB;
    else
        case (m_STATE) is  
        when Comput_eu_AB =>
            if  W_Update_Start then
                 -- This step computes e*conj(uu): Part 1
                 for i in 0 to N_Taps-1 loop
                    eu_I_A(i) := E_I_for_update * UU_I_for_update_w(i);
                    eu_I_B(i) := E_Q_for_update * UU_Q_for_update_w(i);
                    eu_Q_A(i) := E_Q_for_update * UU_I_for_update_w(i);
                    eu_Q_B(i) := E_I_for_update * UU_Q_for_update_w(i);
                 end loop;
                 m_STATE := Comput_eu;
                 W_Vector_Rdy <= '0';
            else
                 W_Vector_Rdy <= '1';   
            end if; 
        when Comput_eu =>
				-- This step computes e*conj(uu): Part 2
                for i in 0 to N_Taps-1 loop
                    eu_I(i) := Sum_Long(eu_I_A(i) , eu_I_B(i));
                    eu_Q(i) := Sum_Long(eu_Q_A(i) ,-eu_Q_B(i));
                end loop;
                 m_STATE := Comput_eumu;
        when Comput_eumu =>
			    -- This step estimates  e*conj(uu)*mu
                 for i in 0 to N_Taps-1 loop
                    temp := eu_I(i)*mu;
                    eu_mu_I(i) := temp(temp'high-1 downto temp'high-1-eu_mu_I(i)'length+1); 
                    temp := eu_Q(i)*mu;
                    eu_mu_Q(i) := temp(temp'high-1 downto temp'high-1-eu_mu_Q(i)'length+1);
                end loop;
                 m_STATE := Comput_Add;
        when Comput_Add  =>
				-- This step computes w[n+1] = w[n] + e[n] * conj(uu[n]) * 
                    for i in 0 to N_Taps-1 loop 
                        W_I_temp(i) := Sum_Frac(W_I(i) , eu_mu_I(i));
                        W_Q_temp(i) := Sum_Frac(W_Q(i) , eu_mu_Q(i));
                    end loop;
                    m_STATE := Update_w;    
        when Update_w =>
					-- This step updates the new coefficients on the main W buffer`
                    if Update_coff ='1' then  -- Update coefficients if still it's allowed from the master module
                        for i in 0 to N_Taps-1 loop 
                            W_I(i) <= W_I_temp(i);
                            W_Q(i) <= W_Q_temp(i);
                        end loop;
                    end if;
                    m_STATE := Comput_eu_AB;
        when others =>
            m_STATE := Comput_eu_AB;
        end case;    
    end if;
end if;
end process;


end Behavioral;
