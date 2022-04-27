----------------------------------------------------------------------------------
-- Company:        ITESM - Campus Qro.
-- Engineer:   Marcela Ibarra Mora
--					Mariana Castro Payns
--					José Manuel Neri Villeda
-- 
-- Create Date:    17:30  08/03/2021 
-- Project Name: 	 Risc CPU for TE2002B
--
-- Description:    Risc Processor Top
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity C06_FullAdder is
	Port(
	  InA 				: in 	std_logic_vector (7 downto 0);
	  InB 				: in 	std_logic_vector (7 downto 0);
	  S					: out std_logic_vector (7 downto 0)
  );
  
end C06_FullAdder;

architecture a of C06_FullAdder is 

begin 

	S <= InA + InB;
	
end a; 