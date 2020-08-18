----------------------------------------------------------------------------------
-- Author: KU Leuven, ESAT, Networked Systems Group  
-- Create Date: 09/27/2019 01:28:26 PM
-- Design Name: Digital Self-interference Canceller
-- Module Name: KUL_pkg 
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
-- Package Declaration Section
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all; 
use IEEE.std_logic_unsigned.all;
use work.fixed_pkg.all;

package KUL_pkg is
 
constant N_bit : integer := 16;
constant N_Taps: integer := 48; 
constant N_frac : integer:= -28;
constant Add_Step1 :  integer := 4;          --  N_Tape= Add_Step1* Add_Step2*Add_Step3
constant Add_Step2 :  integer := 4;          
constant Add_Step3 :  integer := 3;
constant Add_Strid1 :  integer := (Add_Step2*Add_Step3)-1;
constant Add_Strid2 :  integer := Add_Step3-1;

          


type ARRAY_TYPE_Int is array (0 to N_Taps-1) of sfixed(N_bit-1 downto 0);
type ARRAY_TYPE_Frac is array (0 to N_Taps-1) of sfixed(0 downto N_frac+1);
type ARRAY_TYPE_Fixed is array (0 to N_Taps-1) of sfixed(N_bit-1 downto N_frac);
type ARRAY_TYPE_Long is array (0 to N_Taps-1) of sfixed((2*N_bit) -1  downto 0);


function Round_Fixed( 
    A_Int_Frac: in sfixed(N_bit-1 downto N_frac))
    return sfixed;

function Mul_Int_Frac( 
    A_Int : in sfixed(N_bit-1 downto 0);
    B_Frac: in sfixed(0 downto N_frac+1))
    return sfixed;

function Sum_Fixed( 
    A : in sfixed(N_bit-1 downto N_frac);
    B : in sfixed(N_bit-1 downto N_frac))
    return sfixed;


function Sum_Int( 
    A : in sfixed(N_bit-1 downto 0);
    B : in sfixed(N_bit-1 downto 0))
    return sfixed;

function Sum_Long( 
    A : in sfixed((2*N_bit) -1 downto 0);
    B : in sfixed((2*N_bit) -1 downto 0))
    return sfixed;

function Sum_Frac( 
    A : in sfixed(0 downto N_frac+1);
    B : in sfixed(0 downto N_frac+1))
    return sfixed;


end KUL_pkg;


package body KUL_pkg is


---- This funtion returns the intager part of a Sfixed (N_bit-1 downto N_Frac) number.
function Round_Fixed( 
    A_Int_Frac: in sfixed(N_bit-1 downto N_frac))
    return sfixed is
    variable A_Int : sfixed(N_bit-1 downto 0);
begin
    A_Int := A_Int_Frac(N_bit-1 downto 0);
    return A_Int;
end function;
    

-- This function multiplies integer (N_bit.0) with FixedPoint(0.N_frac+1). 
function Mul_Int_Frac( 
    A_Int : in sfixed(N_bit-1 downto 0);
    B_Frac: in sfixed(0 downto N_frac+1))
    return sfixed is
    variable Mul : sfixed(N_bit-1 downto N_Frac);
  begin
    Mul := A_Int * B_Frac;
    return Mul;
end;

---- This function adds two FixedPoint(N_bit-1.N_frac+1). 
function Sum_Fixed( 
    A :in sfixed(N_bit-1 downto N_Frac);
    B :in sfixed(N_bit-1 downto N_Frac))
    return sfixed is
    variable Sum : sfixed(N_bit-1 downto N_Frac);
  begin
    Sum := resize(A+B,Sum'high,Sum'low);
    return Sum;
end;

---- This function adds two Int(N_bit-1.0). 
function Sum_Int( 
    A :in sfixed(N_bit-1 downto 0);
    B :in sfixed(N_bit-1 downto 0))
    return sfixed is
    variable Sum : sfixed(N_bit-1 downto 0);
  begin
    Sum := resize(A + B,Sum'high,Sum'low);
    return Sum;
end;

---- This function adds two Long(2*N_bit-1.0). 
function Sum_Long( 
    A :in sfixed((2*N_bit)-1 downto 0);
    B :in sfixed((2*N_bit)-1 downto 0))
    return sfixed is
    variable Sum : sfixed((2*N_bit)-1 downto 0);
  begin
    Sum := resize(A+B,Sum'high,0);
    return Sum;
end;


---- This function adds two Frac(0.N_Frac+1). 
function Sum_Frac( 
    A :in sfixed(0 downto N_Frac + 1);
    B :in sfixed(0 downto N_Frac + 1))
    return sfixed is
    variable Sum : sfixed(0 downto N_Frac + 1);
  begin
    Sum := resize(A+B,0,Sum'low);
    return Sum;
end;

end package body KUL_pkg;