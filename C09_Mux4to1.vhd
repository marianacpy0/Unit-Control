----------------------------------------------------------------------------------
-- Company:        ITESM - Campus Qro.
-- Engineer:   Marcela Ibarra Mora
--					Mariana Castro Payns
--					José Manuel Neri Villeda
-- 
-- Create Date:    17:30  08/03/2021 
-- Project Name: 	 C09_Mux4to1
--
-- Description:    
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity C09_Mux4to1 is
	Port(
	  InA 				: in 	std_logic_vector (7 downto 0);
	  InB 				: in 	std_logic_vector (7 downto 0);
	  InC 				: in 	std_logic_vector (7 downto 0);
	  InD 				: in 	std_logic_vector (7 downto 0);
	  Sel 				: in 	std_logic_vector (1 downto 0);
	  M					: out std_logic_vector (7 downto 0)
	);
end C09_Mux4to1; 

architecture a of C09_Mux4to1 is

begin 

	Process(Sel)
	begin 
		if Sel = "00" then
			M <= InA;
		elsif Sel = "01" then
			M <= InB;
		elsif Sel = "10" then
			M <= InC;
		else 
			M <= InD;
		end if;
	end process;

end a;