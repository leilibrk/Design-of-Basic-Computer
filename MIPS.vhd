----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:18:42 06/14/2021 
-- Design Name: 
-- Module Name:    MIPS - Behavioral 
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
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity MIPS is
	port ( clk:    in std_logic;
			 rst: 	in std_logic;
			 result: out std_logic_vector(7 downto 0);
			 pc: out std_logic_vector(3 downto 0)
			 );
end MIPS;

architecture Behavioral of MIPS is
signal instruction: std_logic_vector(15 downto 0);
signal opcode: std_logic_vector(3 downto 0);
signal rs: std_logic_vector(3 downto 0);
signal rt: std_logic_vector(3 downto 0);
signal rd: std_logic_vector(3 downto 0);
signal a : std_logic_vector(7 downto 0);
signal b : std_logic_vector(7 downto 0);
signal pc_s: std_logic_vector(3 downto 0);

type ROM_type is array (0 to 15 ) of std_logic_vector(15 downto 0);
constant ins_mem: ROM_type:=(
   "1000000110000000",
   "0010110010001011",
   "1100010000000011",
   "0001000111000000",
   "0110110100010001",
   "1100000001111011",
   "0000000000000000",
   "0000000000000000",
   "0000000000000000",
   "0000000000000000",
   "0000000000000000",
   "0000000000000000",
   "0110110100010001",
   "1100101100000000",
   "0100111100001110",
   "0101111000001110"
  );
type ROM_type_2 is array (0 to 15 ) of std_logic_vector(7 downto 0);
signal reg_file: ROM_type_2;
signal data_mem: ROM_type_2;
begin

 instruction <= ins_mem(to_integer(unsigned(pc_s)));
 opcode <= instruction(15 downto 12);
 rs <= instruction(11 downto 8);
 rt <= instruction(7 downto 4);
 rd <= instruction(3 downto 0);
 a <= reg_file(to_integer(unsigned(rs)));
 b <= reg_file(to_integer(unsigned(rt)));
 
Process(clk,rst,reg_file,data_mem,pc_s,rs,rt,rd,a,b,opcode)
		variable res: std_logic_vector(7 downto 0);
		begin
		If (rst = '0') then
		pc_s<="0000";
		reg_file(0) <= "00000000";
		reg_file(1) <= "00000001";
		reg_file(2) <= "00000010";
		reg_file(3) <= "00000011";
		reg_file(4) <= "00000100";
		reg_file(5) <= "00000101";
		reg_file(6) <= "00000110";
		reg_file(7) <= "00000111";
		reg_file(8) <= "00001000";
		reg_file(9) <= "00001001";
		reg_file(10) <= "00001010";
		reg_file(11) <= "00001011";
		reg_file(12) <= "00001100";
		reg_file(13) <= "00001101";
		reg_file(14) <= "00001110";
		reg_file(15) <= "00001111";
		data_mem(0) <= "00000000";
		data_mem(1) <= "00000001";
		data_mem(2) <= "00000010";
		data_mem(3) <= "00000011";
		data_mem(4) <= "00000100";
		data_mem(5) <= "00000101";
		data_mem(6) <= "00000110";
		data_mem(7) <= "00000111";
		data_mem(8) <= "00001000";
		data_mem(9) <= "00001001";
		data_mem(10) <= "00001010";
		data_mem(11) <= "00001011";
		data_mem(12) <= "00001100";
		data_mem(13) <= "00001101";
		data_mem(14) <= "00001110";
		data_mem(15) <= "00001111";
		elsif rising_edge(clk) then
		--check opcode: 
		case opcode is
		when "0000"=> --brz
			if(a="00000000") then
				pc_s<=rt;
			end if;
		when "0001"=> --brnz
			if(a/="00000000") then
				pc_s<=rt;
			end if;
		when "0010"=>  --add
			res := a+b;
			reg_file(to_integer(unsigned(rd))) <= res ;
			pc_s<=pc_s+1;
		when "0011"=>  --sub
			res := a-b;
			reg_file(to_integer(unsigned(rd))) <= res ;
			pc_s<=pc_s+1;
		when "0100" =>  --load
			res := data_mem(to_integer(unsigned(rs)));
			reg_file(to_integer(unsigned(rd))) <= res;
			pc_s<=pc_s+1;
		when "0101" =>	--store
			res := reg_file(to_integer(unsigned(rs)));
			data_mem(to_integer(unsigned(rd))) <= res;
			pc_s<=pc_s+1;
		when "0110" =>	--Ror
			res := to_stdlogicvector(to_bitvector(a) ror (to_integer(unsigned(rt))));
			reg_file(to_integer(unsigned(rd))) <= res;
			pc_s<=pc_s+1;
		when "0111" =>	--Rol
			res := to_stdlogicvector(to_bitvector(a) rol (to_integer(unsigned(rt))));
			reg_file(to_integer(unsigned(rd))) <= res;
			pc_s<=pc_s+1;
		when "1000" =>	--And
			res := a and b;
			reg_file(to_integer(unsigned(rd))) <= res ;
			pc_s<=pc_s+1;
		when "1001" =>	--Xor
			res := a xor b;
			reg_file(to_integer(unsigned(rd))) <= res ;
			pc_s<=pc_s+1;
		when "1010" => --Or
			res := a or b;
			reg_file(to_integer(unsigned(rd))) <= res ;
			pc_s<=pc_s+1;
		when "1011" => --Not
			res := not (a);
			reg_file(to_integer(unsigned(rd))) <= res ;
			pc_s<=pc_s+1;
		when "1100" =>	--show
			res := a;
			pc_s<=pc_s+1;
		when "1101" =>	--shl
			res := to_stdlogicvector(to_bitvector(a) sll (to_integer(unsigned(rt))));
			reg_file(to_integer(unsigned(rd))) <= res;
			pc_s<=pc_s+1;
		when "1110" => --shr
			res := to_stdlogicvector(to_bitvector(a) srl (to_integer(unsigned(rt))));
			reg_file(to_integer(unsigned(rd))) <= res;
			pc_s<=pc_s+1;
		when others =>
			res := "00000000";
		end case;
		else
		end if;
		result <= res;
	end Process;
	
	pc<=pc_s;
end Behavioral;