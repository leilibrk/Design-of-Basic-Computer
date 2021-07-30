----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:34:07 06/14/2021 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
	port ( a : in std_logic_vector( 7 downto 0);
			 b : in std_logic_vector( 7 downto 0);
			 opcode: in std_logic_vector( 3 downto 0);
			 res: out std_logic_vector( 7 downto 0)
			 );
			 
end ALU;

architecture Behavioral of ALU is
signal result: std_logic_vector(15 downto 0);
begin
	process(opcode,a,b)
	begin
		case opcode is
		when "0000"=> --brz
		
		when "0001"=> --brnz
		
		when "0010"=>  --add
			result <= a+b;
		when "0011"=>  --sub
			result <= a-b;
		when "0100" =>  --load
		
		when "0101" =>	--store
		
		when "0110" =>	--Ror
		
		when "0111" =>	--Rol
		
		when "1000" =>	--And
			result <= a and b;
		when "1001" =>	--Xor
			result <= a xor b;
		when "1010" => --Or
			result <= a or b;
		when "1011" => --Not
			result <= not (a);
		when "1100" =>	--show
		
		when "1101" =>	--shl
		
		when "1110" => --shr
		
		when others =>
			result <= "0000000000000000";
		end case;
	end process;
	res <= result;
end Behavioral;

