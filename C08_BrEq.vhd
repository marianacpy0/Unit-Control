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

entity C08_BrEq is
	Port(
	  InA 				: in  std_logic;
	  InB 				: in  std_logic;
	  Sel 				: in  std_logic;
	  M   				: out std_logic
	);
	
end C08_BrEq;

architecture a of C08_BrEq is

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