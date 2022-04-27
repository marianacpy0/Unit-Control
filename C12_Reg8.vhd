----------------------------------------------------------------------------------
-- Company:        ITESM - Campus Qro.
-- Engineer:   Marcela Ibarra Mora
--					Mariana Castro Payns
--					José Manuel Neri Villeda
-- 
-- Create Date:    17:30  08/03/2021 
-- Project Name: 	 Risc CPU for TE2002B
--
-- Module Name:    Reg8
-- Description:    
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity C12_Reg8 is 
port(
		En		: in  std_logic: 								-- Esto me indica si esta prendido o no
		Inrs 	: in  std_logic_vector (7 downto 0);	-- Es mi dato a desplegar
		Clk	: in  std_logic;								-- Divisor de frecuencia
		Cen	: in  std_logic;								
		Rst	: in  std_logic;
		OutD	: out std_logic_vector (7 downto 0);
);
end C12_Reg8;

architecture rtl of C12_Reg8 is
begin

	startereg : process(Clk,Rst,En)
	begin 
		if En = '1' then
			if Rst = '0' then 
				Inrs <= Inrs;
			elsif falling_edge(Clk) then 
				if Cen = '1' then 
				Inrs <= OutD;
				end if;
			end if;
		end if;
	end process statereg;
end rtl;