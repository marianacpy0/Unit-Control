----------------------------------------------------------------------------------
-- Company:        ITESM - Campus Qro.
-- Engineer:   Marcela Ibarra Mora
--					Mariana Castro Payns
--					José Manuel Neri Villeda
-- 
-- Create Date:    17:30  08/03/2021 
-- Project Name: 	 C03_CrtlUnit
--
-- Description:    
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

Entity C03_CtrlUnit is 
	Port ( 
			 Oper         : in std_logic_vector(3 downto 0);
			 RegScr_Op    : out std_logic_vector (1 downto 0);
			 ALUOp_Op  	  : out std_logic_vector (2 downto 0);
			 RegWrite_Op  : out std_logic;
			 Write7Seg_Op : out std_logic;
			 WriteLEDs_Op : out std_logic;
			 PCInc_Op     : out std_logic;
			 Beq_Op       : out std_logic;
			 JiJr_Op      : out std_logic_vector (1 downto 0)
			);
			 
End C03_CtrlUnit;

Architecture rtl of C03_CtrlUnit is
 Begin 
  output : Process(Oper)
  Begin 
  Case Oper is 
	When "0000" => 
	  RegScr_Op <= "10";
	  ALUOp_Op  <= "000";
	  RegWrite_Op <= '1';
	  Write7Seg_Op <= '0';
	  WriteLEDs_Op <= '0';
	  PCInc_Op <= '0';
	  Beq_Op <= '0';
	  JiJr_Op <= "00";
	When "0001" => 
	  RegScr_Op <= "10";
	  ALUOp_Op  <= "001";
	  RegWrite_Op <= '1';
	  Write7Seg_Op <= '0';
	  WriteLEDs_Op <= '0';
	  PCInc_Op <= '0';
	  Beq_Op <= '0';
	  JiJr_Op <= "00";
	When "0010" => 
	  RegScr_Op <= "10";
	  ALUOp_Op  <= "010";
	  RegWrite_Op <= '1';
	  Write7Seg_Op <= '0';
	  WriteLEDs_Op <= '0';
	  PCInc_Op <= '0';
	  Beq_Op <= '0';
	  JiJr_Op <= "00";
	When "0011" => 
	  RegScr_Op <= "10";
	  ALUOp_Op  <= "011";
	  RegWrite_Op <= '1';
	  Write7Seg_Op <= '0';
	  WriteLEDs_Op <= '0';
	  PCInc_Op <= '0';
	  Beq_Op <= '0';
	  JiJr_Op <= "00";  
	When "0100" => 
	  RegScr_Op <= "10";
	  ALUOp_Op  <= "100";
	  RegWrite_Op <= '1';
	  Write7Seg_Op <= '0';
	  WriteLEDs_Op <= '0';
	  PCInc_Op <= '0';
	  Beq_Op <= '0';
	  JiJr_Op <= "00";
	When "0101" => 
	  RegScr_Op <= "10";
	  ALUOp_Op  <= "101";
	  RegWrite_Op <= '1';
	  Write7Seg_Op <= '0';
	  WriteLEDs_Op <= '0';
	  PCInc_Op <= '0';
	  Beq_Op <= '0';
	  JiJr_Op <= "00"; 
	When "0110" => 
	  RegScr_Op <= "10";
	  ALUOp_Op  <= "110";
	  RegWrite_Op <= '1';
	  Write7Seg_Op <= '0';
	  WriteLEDs_Op <= '0';
	  PCInc_Op <= '0';
	  Beq_Op <= '0';
	  JiJr_Op <= "00";
	When "0111" => 
	  RegScr_Op <= "10";
	  ALUOp_Op  <= "111";
	  RegWrite_Op <= '1';
	  Write7Seg_Op <= '0';
	  WriteLEDs_Op <= '0';
	  PCInc_Op <= '0';
	  Beq_Op <= '0';
	  JiJr_Op <= "00";
	When "1000" => 
	  RegScr_Op <= "00";
	  ALUOp_Op  <= "000";
	  RegWrite_Op <= '1';
	  Write7Seg_Op <= '0';
	  WriteLEDs_Op <= '0';
	  PCInc_Op <= '0';
	  Beq_Op <= '0';
	  JiJr_Op <= "00";
	When "1001" => 
	  RegScr_Op <= "01";
	  ALUOp_Op  <= "000";
	  RegWrite_Op <= '1';
	  Write7Seg_Op <= '0';
	  WriteLEDs_Op <= '0';
	  PCInc_Op <= '0';
	  Beq_Op <= '0';
	  JiJr_Op <= "00";
	When "1010" => 
	  RegScr_Op <= "00";
	  ALUOp_Op  <= "001";
	  RegWrite_Op <= '0';
	  Write7Seg_Op <= '0';
	  WriteLEDs_Op <= '0';
	  PCInc_Op <= '0';
	  Beq_Op <= '1';
	  JiJr_Op <= "00";
	When "1011" => 
	  RegScr_Op <= "00";
	  ALUOp_Op  <= "000";
	  RegWrite_Op <= '0';
	  Write7Seg_Op <= '0';
	  WriteLEDs_Op <= '0';
	  PCInc_Op <= '0';
	  Beq_Op <= '0';
	  JiJr_Op <= "10";
	When "1100" => 
	  RegScr_Op <= "00";
	  ALUOp_Op  <= "000";
	  RegWrite_Op <='0';
	  Write7Seg_Op <= '0';
	  WriteLEDs_Op <= '0';
	  PCInc_Op <= '0';
	  Beq_Op <= '0';
	  JiJr_Op <= "01";
	When "1101" => 
	  RegScr_Op <= "00";
	  ALUOp_Op  <= "000";
	  RegWrite_Op <= '0';
	  Write7Seg_Op <= '1';
	  WriteLEDs_Op <= '0';
	  PCInc_Op <= '0';
	  Beq_Op <= '0';
	  JiJr_Op <= "00";
	When "1110" => 
	  RegScr_Op <= "00";
	  ALUOp_Op  <= "000";
	  RegWrite_Op <= '0';
	  Write7Seg_Op <= '0';
	  WriteLEDs_Op <= '1';
	  PCInc_Op <= '0';
	  Beq_Op <= '0';
	  JiJr_Op <= "00";
	When "1111" => 
	  RegScr_Op <= "11";
	  ALUOp_Op  <= "000";
	  RegWrite_Op <= '1';
	  Write7Seg_Op <= '0';
	  WriteLEDs_Op <= '0';
	  PCInc_Op <= '0';
	  Beq_Op <= '0';
	  JiJr_Op <= "00";
	End Case;
	End Process output;
End rtl;
  
  
