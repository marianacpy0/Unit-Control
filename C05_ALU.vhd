----------------------------------------------------------------------------------
-- Company:        ITESM - Campus Qro.
-- Engineer:   Marcela Ibarra Mora
--					Mariana Castro Payns
--					José Manuel Neri Villeda
-- 
-- Create Date:    17:30  08/03/2021 
-- Project Name: 	 C05_ALU
--
-- Description:    
--
----------------------------------------------------------------------------------
Library ieee;
Use ieee.std_logic_1164.all;
Use ieee.std_logic_unsigned.all;


Entity C05_ALU is
PORT (
		 Sel : in std_logic_vector(2 downto 0);   			-- Recibe un valor de 4 bits de la UC para saber la operación a realizar
		 inA, inB : in std_logic_vector(7 downto 0);			-- Reciben 8 bits de los registros rs y rt 
		 Zero: out std_logic;										-- Bandera que indica si el resultado es 0
		 Oper: out std_logic_vector(7 downto 0));				-- Salida del resultado de la operacion
		
End C05_ALU;


Architecture a of C05_ALU is

	signal OperEmb : std_logic_vector(7 downto 0);
	signal inB_temp: std_logic_vector(7 downto 0);
	signal inB_resta: std_logic_vector(7 downto 0); 
	--signal Carry_resta_a01231973: std_logic_vector(3 downto 0) := "1111"; 
	
Begin

	--senal_oper_a01231973 <= operacion_a01231973(2 downto 0);

	process (Sel, inA, inB) -- Cuando cualquiera de estos cambie se realiza el proceso
	begin
		
		Case (Sel) is 
			when "000" => -- Operación suma de inA y inB
				OperEmb <= (inA) + (inB);
				if (OperEmb = "00000000") then  --Si la operación da un resultado de 0, prende la bandera
					Zero <= '1';
					Oper <= OperEmb(7 downto 0);
				else 
					Oper <= OperEmb(7 downto 0);
					Zero <= '0';
				end if;
				
			when "001" =>  -- Operación Resta de inA y inB
				inB_temp <= not inB;
				inB_resta <= inB_temp + 1;
				
				OperEmb  <= (inA) + (inB_resta);
				
				if (OperEmb = "00000000") then  --Si la operación da un resultado de 0, prende la bandera
					Zero <= '1';
					Oper <= OperEmb(7 downto 0);
				else 
					Oper <= OperEmb(7 downto 0);
					Zero <= '0';
				end if;

				
			when "010" => -- Operación inA and inB
				OperEmb <= inA and inB;
				
				if (OperEmb = "00000000") then  --Si la operación da un resultado de 0, prende la bandera
					Zero <= '1';
					Oper <= OperEmb(7 downto 0);
				else 
					Oper <= OperEmb(7 downto 0);
					Zero <= '0';
				end if;
		
			when "011" => -- Operación inA or inB
				OperEmb <= inA or inB;
				
				if (OperEmb = "00000000") then  --Si la operación da un resultado de 0, prende la bandera
					Zero <= '1';
					Oper <= OperEmb(7 downto 0);
				else 
					Oper <= OperEmb(7 downto 0);
					Zero <= '0';
				end if;
							
			when "100" => -- Operación inA xor inB
				OperEmb <= inA xor inB;
				
				if (OperEmb = "00000000") then  --Si la operación da un resultado de 0, prende la bandera
					Zero <= '1';
					Oper <= OperEmb(7 downto 0);
				else 
					Oper <= OperEmb(7 downto 0);
					Zero <= '0';
				end if;
				
			when "101" => 
				OperEmb <= not inA; -- Operación not inA
				
				if (OperEmb = "00000000") then  --Si la operación da un resultado de 0, prende la bandera
					Zero <= '1';
					Oper <= OperEmb(7 downto 0);
				else 
					Oper <= OperEmb(7 downto 0);
					Zero <= '0';
				end if;
				
			when "110" =>
				OperEmb <= inA(6 downto 0) & '0';
				
				if (OperEmb = "00000000") then  --Si la operación da un resultado de 0, prende la bandera
					Zero <= '1';
					Oper <= OperEmb(7 downto 0);
				else 
					Oper <= OperEmb(7 downto 0);
					Zero <= '0';
				end if;
				
			when "111" => 
				OperEmb <= '0' & inA(7 downto 1);
				
				if (OperEmb = "00000000") then  --Si la operación da un resultado de 0, prende la bandera
					Zero <= '1';
					Oper <= OperEmb(7 downto 0);
				else 
					Oper <= OperEmb(7 downto 0);
					Zero <= '0';
				end if;
				
		end case;
	end process;



END a;

