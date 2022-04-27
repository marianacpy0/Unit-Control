----------------------------------------------------------------------------------
-- Company:        ITESM - Campus Qro.
-- Engineer:   Marcela Ibarra Mora
--					Mariana Castro Payns
--					José Manuel Neri Villeda
-- 
-- Create Date:    17:30  08/03/2021 
-- Project Name: 	 Risc CPU for TE2002B
--
-- Module Name:    
-- Description:    
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity C14_Dec7Seg is 
port(
	Inr	: in 	std_logic_vector (3 downto 0);
	Seg	: out	std_logic_vector (7 downto 4)
);
end C14_Dec7Seg;

architecture rtl of C14_Dec7Seg is
begin
	process (Inr)
	begin
		if 	Inr = "0000" then Seg <= "11000000";
		elsif Inr = "0001" then Seg <= "11111001";
		elsif Inr = "0010" then Seg <= "10100100";
		elsif Inr = "0011" then Seg <= "10110000";
		elsif Inr = "0100" then Seg <= "10011001";
		elsif Inr = "0101" then Seg <= "10010010";
		elsif Inr = "0110" then Seg <= "10000010";
		elsif Inr = "0111" then Seg <= "10111000";
		elsif Inr = "1000" then Seg <= "10000000";
		elsif Inr = "1001" then Seg <= "10011000";
		elsif Inr = "1010" then Seg <= "10001000";
		elsif Inr = "1011" then Seg <= "00000000";
		elsif Inr = "1100" then Seg <= "11000110";
		elsif Inr = "1101" then Seg <= "01000000";
		elsif Inr = "1110" then Seg <= "10000110";
		elsif Inr = "1111" then Seg <= "10001110";
		else 					 then Seg <= "11111111";
end rtl;