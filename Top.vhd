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

entity Top is
  Port(
    Clk50Mhz : in std_logic;
	 Clr 		 : in std_logic;
	 Switches : in std_logic_vector(7 downto 0);
	 LEDs		 : out std_logic_vector(7 downto 0);
	 SegH		 : out std_logic_vector(7 downto 0);
	 SegL		 : out std_logic_vector(7 downto 0);
	 Turnoff  : out std_logic_vector(31 downto 0)
	 );
	 
end Top;

architecture rtl of Top is
<<<<<<< Updated upstream
-- Component declarations
=======
 --Component declarations
>>>>>>> Stashed changes
  
  Component C01_ProgCounter
    Port ( 
      Clk   			: in 	std_logic;
      Cen 				: in 	std_logic;
      Rst   			: in 	std_logic;
      PCIn  			: in 	std_logic;
      PCOut 			: out std_logic_vector (7 downto 0)
    );
  end Component;
  
  Component C02_Mem
    Port (
      Addr 	 			: in 	std_logic_vector (7 downto 0);
      DataOp 			: out std_logic_vector (3 downto 0);
      Datars 			: out std_logic_vector (2 downto 0);
      Datart 			: out std_logic_vector (2 downto 0);
      Datard 			: out std_logic_vector (2 downto 0);
      Datai  			: out std_logic_vector (7 downto 0)
    );
  end Component;
  
  Component C03_CtrlUnit
    Port (
      Oper 				: in 	std_logic_vector (3 downto 0);
      RegScr_Op    	: out std_logic_vector (1 downto 0);
      ALUOp_Op     	: out std_logic_vector (2 downto 0);
      RegWrite_Op  	: out std_logic;
      Write7Seg_Op 	: out std_logic;
      WriteLEDs_Op 	: out std_logic;
      PCInc_Op		 	: out std_logic;
      Beq_Op  		 	: out std_logic;
      JiJr_Op		 	: out std_logic_vector (1 downto 0)
        );
  end Component;  
  
  Component C04_Registers
    Port (
     Clk   				: in 	std_logic;
     Cen   				: in 	std_logic;
     Rst   				: in 	std_logic;
     WE    				: in 	std_logic;
     SelA 				: in 	std_logic_vector (2 downto 0);
     SelB  				: in 	std_logic_vector (2 downto 0);
     SelWR 				: in 	std_logic_vector (2 downto 0);
     Data  				: in 	std_logic_vector (7 downto 0);
     OutA  				: out std_logic_vector (7 downto 0);
     OutB  				: out std_logic_vector (7 downto 0)
    );
  end Component;
      
  Component C05_ALU
	Port(
	  InA					: in 	std_logic_vector (7 downto 0);
	  InB					: in 	std_logic_vector (7 downto 0);
	  Sel					: in 	std_logic_vector (2 downto 0);
	  Zero				: out std_logic;
	  Oper				: out std_logic_vector (7 downto 0)
	);
  End component;
  
  Component C06_FullAdder
  Port(
	  InA 				: in 	std_logic_vector (7 downto 0);
	  InB 				: in 	std_logic_vector (7 downto 0);
	  S					: out std_logic_vector (7 downto 0)
  );
  end component;
  
  Component C07_Increm
  Port(
	  InA 				: in 	std_logic_vector (7 downto 0);
	  InB 				: in 	std_logic_vector (7 downto 0);
	  Sel					: in 	std_logic;
	  M					: out std_logic_vector (7 downto 0)
  );
  end component; 
  
  Component C08_BrEq
	Port(
	  InA 				: in  std_logic;
	  InB 				: in  std_logic;
	  Sel 				: in  std_logic;
	  M   				: out std_logic
	);
  end component;
  
  Component C09_Mux4to1
	Port(
	  InA 				: in 	std_logic_vector (7 downto 0);
	  InB 				: in 	std_logic_vector (7 downto 0);
	  InC 				: in 	std_logic_vector (7 downto 0);
	  InD 				: in 	std_logic_vector (7 downto 0);
	  Sel 				: in 	std_logic_vector (1 downto 0);
	  M					: out std_logic_vector (7 downto 0)
	);
  end component;
  
  Component C10_Mux4to1
   Port(
	  InA 				: in 	std_logic_vector (7 downto 0);
	  InB 				: in 	std_logic_vector (7 downto 0);
	  InC 				: in 	std_logic_vector (7 downto 0);
	  InD 				: in 	std_logic_vector (7 downto 0);
	  Sel 				: in 	std_logic_vector (1 downto 0);
	  M					: out std_logic_vector (7 downto 0)
	);
	end component;
	
	Component C11_Reg8
	 Port(
	   Inrs 				: in 	std_logic_vector (7 downto 0);
		Clk  				: in 	std_logic;
		Cen  				: in 	std_logic;
		Rst  				: in 	std_logic;
		En   				: in 	std_logic;
		OutD 				: out std_logic_vector (7 downto 0)
	 );
	end component;
	
	
	Component C12_Reg8
	 Port(
	   Inrs 				: in 	std_logic_vector (7 downto 0);
		Clk  				: in 	std_logic;
		Cen  				: in 	std_logic;
		Rst  				: in 	std_logic;
		En   				: in 	std_logic;
		OutD 				: out std_logic_vector (7 downto 0)
	 );
	end component;
  
  
   Component C13_Dec7Seg
	 Port(
		InR 				: in 	std_logic_vector (7 downto 0);
		Seg 				: out std_logic_vector (7 downto 0)
	 );
	 
	 Component C14_Dec7Seg
	  Port(
		InR 				: in 	std_logic_vector (7 downto 0);
		Seg 				: out std_logic_vector (7 downto 0)
	 );
	 
	 Component C15_ClkDiv
	  Port(
		Clkin 			: in 	std_logic;
		Rst   			: in 	std_logic;
		Clkout			: out std_logic
	  );
	 end component;
	 
	 Component C16_DispOff
	  Port(
		Turnoff 			: out std_logic_vector (31 downto 0)
	  );
	 end component;
	 
  
	--Señales
	signal ClkEn    	: std_logic;								-- señal de relog
	signal PC			: std_logic_vector (7 downto 0);		-- Señal del Program Counter
	signal Opcode  	: std_logic_vector (3 downto 0);		-- Señal para Opcode que va de la memoria al CU
	signal rs  			: std_logic_vector (3 downto 0);		-- Señal para la direccion del registro rs
	signal rt  			: std_logic_vector (3 downto 0);		-- Señal para la direccion del registro rt
	signal rd  			: std_logic_vector (3 downto 0);		-- Señal para la direccion del registro rd
	signal imm			: std_logic_vector (7 downto 0);		-- Señal para el immediate va de la memoria al C09 y al C07
	signal BrJiJrM 	: std_logic_vector (7 downto 0);		-- Señal para el siguiente PC, va del C10 a al Program Counter
	signal RegSrc  	: std_logic_vector (1 downto 0);		-- Señal que manda pulso a C09
	signal ALUOp  	 	: std_logic_vector (2 downto 0);		-- Señal que manda la operación a hacer a la ALU
	signal RegWrite   : std_logic;								-- Señal que manda pulso a los registros
	signal Write7Seg  : std_logic;								-- Señal que manda pulso a C11
	signal WriteLEDs  : std_logic;								-- Señal que manda pulso a C12
	signal PCinc	   : std_logic;								-- Señal que manda pulso a C08
	signal Beq  	   : std_logic;								-- Señal que manda pulso a C08
	signal JiJr  	 	: std_logic_vector (1 downto 0); 	-- Señal que manda pulso a C10
	signal DataM 		: std_logic_vector (7 downto 0);		-- Señal que manda datos de 8-bits del C09 a los registros
	signal rsd 			: std_logic_vector (7 downto 0);    -- Señal que manda el contenido del registro rs de los registros a la ALU
	signal rtd 			: std_logic_vector (7 downto 0);    -- Señal que manda el contenido del registro rt de los registros a la ALU
	signal ALUZero		: std_logic; 								-- Señal que manda el valor de la bandera de la ALU a C08
	signal ALUOper    : std_logic_vector (7 downto 0); 	-- Señal que manda el resultado de la operación al C09
	signal IncremM 	: std_logic_vector(7 downto 0);  	-- Señal que manda dato de C07 a C06
	signal AdderS		: std_logic_vector(7 downto 0); 		-- Señal que manda dato de c06 a C10
	signal BrEqM		: std_logic;								-- Señal que manda un 0 o 1 de C08 a C07
	signal D				: std_logic_vector(7 downto 0);		-- Señal que manda dato del c11 al c13 y c14

	
begin

	C01 : C01_ProgCounter
			port map (
							PCIn  => BrJiJrM,
							PCOut => PC,
							Clk   => Clk50MHz,
							Cen   => ClkEn,
							rst   => Clr);
							
	C02 : C02_Mem
			port map (
							Addr   	  => PC,
							DataOp     => Opcode,
							Datars     => rs,
							Datart     => rt,
							Datard     => rd,
							Datai      => imm);
							
	C03 : C03_CtrlUnit
			port map (
							Oper    		  => Opcode,
							RegSrc_Op     => RegSrc,
							ALUOp_Op      => ALUOp,
							RegWrite_Op   => RegWrite,
							Write7Seg_Op  => Write7Seg,
							WriteLEDs_Op  => WriteLEDs,
							PCinc_Op		  => PCinc,
							Beq_Op		  => Beq,
							JiJr_Op		  => JiJr);
							
	C04 : C04_Registros
			port map (
							SelA    		  => rs,
							SelB		     => rt,
							SelWR         => rd,
							Data		     => DataM,
							Clk   		  => Clk50MHz,
							Cen			  => ClkEn,
							Rst			  => Clr,
							WE				  => RegWrite,
							OutA			  => rsd
							OutB			  => rtd);
							
	C05 : C05_ALU
			port map (
							InA    		  => rsd,
							InB		     => rtd,
							Sel           => ALUOp,
							Zero		     => ALUZero,
							Oper   		  => ALUOper);
							
	C06 : C06_FullAdder
			port map (
							InA    		  => PC,
							InB		     => IncremM,
							S	           => AdderS);
							
	C07 : C07_Increm
			port map (
							InA    		  => "00000001",
							InB		     => imm,
							Sel           => BrEqM,
							M			     => IncremM);
	C08 : C08_BrEq
			port map (
							InA    		  => PCInc,
							InB		     => ALUZero,
							Sel           => Beq,
							M			     => BrEqM);
	C09 : C09_Mux4to1
			port map (
							InA    		  => imm,
							InB		     => PC,
							InC			  => ALUOper,
							InD		     => Switches,
							M			     => DataM,
							Sel           => RegSrc);
	
	C10 : C10_Mux4to1
			port map (
							InA    		  => AdderS,
							InB		     => rsd,
							InC			  => imm,
							InD		     => "00000000",
							M			     => BrJiJrM,
							Sel           => JiJr);
							
	C11 : C11_Reg8
			port map (
							Inrs    		  => rsd,
							En			     => Write7Seg,
							Clk			  => Clk50MHz,
							Cen		     => ClkEn,
							Rst		     => Clr,
							OutD          => D);
							
	C12 : C12_Reg8
			port map (
							Inrs    		  => rsd,
							En			     => WriteLEDs,
							Clk			  => Clk50MHz,
							Cen		     => ClkEn,
							Rst		     => Clr,
							OutD			  => LEDs);
							
	C13 : C13_Dec7Seg
			port map (
							InR    		  => D,
							Seg			  => SegH);
				
	C14 : C14_Dec7Seg
			port map (
							InR    		  => D,
							Seg			  => SegL);
	
	C15 : C15_ClkDiv
			port map (
							Clkin    	  => Clk50Mhz,
							Rst			  => Clr,
							Clkout		  => ClkEn);
							
	C16 : C16_ClkDiv
			port map (
							Turnoff    	  => Turnoff);

end rtl;
