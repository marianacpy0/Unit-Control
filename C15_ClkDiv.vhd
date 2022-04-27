----------------------------------------------------------------------------------
-- Company:        ITESM - Campus Qro.
-- Engineer:   Marcela Ibarra Mora
--					Mariana Castro Payns
--					José Manuel Neri Villeda
-- 
-- Create Date:    17:30  08/03/2021 
-- Project Name: 	 C15_ClkDiv
--
-- Description:    Risc Processor Top
--
----------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity C15_ClkDiv is
	Port(
		Clkin 			: in 	std_logic;
		Rst   			: in 	std_logic;
		Clkout			: out std_logic
	  );
	  
end C15_ClkDiv;

architecture a of C15_ClkDiv is 

	  -- Embedded signals declaration
  -- Used by Frequency Divider (FreqDiv)

  -- Define a value that contains the desired Frequency
  constant DesiredFreq : natural := 2;  -- Once per second changes in the FSM / dos pulso por segundo
  -- Frequency for a DE2-Lite board is 50MHz
  constant BoardFreq   : natural := 50_000_000; --la frecuencia de la targeta
  -- Calculate the value the counter should reach to obtain desired Freq.
  constant MaxOscCount : natural := BoardFreq / DesiredFreq;
  -- Pulse counter for the oscillator
  signal OscCount      : natural range 0 to MaxOscCount;

Begin 

freq_div: process(Rst, Clkin)
	begin
		if (Rst ='0') then
			oscCount <= 0;
		elsif (rising_edge (Clkin)) then
			if (oscCount = MaxOscCount) then
				Clkout <= '1';
				oscCount <= 0;
			else 
				Clkout <= '0';
				oscCount <= OscCount + 1;
			end if;
		end if;
	end process Freq_div;


end a;