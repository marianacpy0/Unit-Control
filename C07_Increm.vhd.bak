----------------------------------------------------------------------------------
-- Company:        ITESM - Campus Qro.
-- Engineer:   Marcela Ibarra Mora
--					Mariana Castro Payns
--					José Manuel Neri Villeda
-- 
-- Create Date:    17:30  08/03/2021 
-- Project Name: 	 C07_Increm
--
-- Description:    
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity C07_Increm is
	Port(
	  InA 				: in 	std_logic_vector (7 downto 0);
	  InB 				: in 	std_logic_vector (7 downto 0);
	  Sel 				: in 	std_logic;
	  M					: out std_logic_vector (7 downto 0)
  );

end C07_Increm;

architecture a of C07_Increm is

begin 
	Process(Sel)
	begin 
		if Sel = '0' then
			M <= InA;
		else 
			M <= InB;
		end if;
	end process;

end a;