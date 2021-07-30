--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:57:54 06/15/2021
-- Design Name:   
-- Module Name:   C:/Users/Leili/Desktop/aze memari/az9/computer/tb_MIPS.vhd
-- Project Name:  computer
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MIPS
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_MIPS IS
END tb_MIPS;
 
ARCHITECTURE behavior OF tb_MIPS IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MIPS
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         result : OUT  std_logic_vector(7 downto 0);
			pc : OUT std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';

	
   

 	--Outputs
   signal result : std_logic_vector(7 downto 0);
	signal pc : std_logic_vector(3 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MIPS PORT MAP (
          clk => clk,
          rst => rst,
          result => result,
			 pc => pc
        );


 

   -- Stimulus process
   stim_proc: process
   begin		
		clk<='0'; 
		rst <='0';
		wait for 10 ns;
		
		clk<='1'; 
		rst <='1';
		wait for 10 ns;

		clk<='0'; 
		wait for 10 ns;
		
		clk<='1'; 
		wait for 10 ns;

		
		clk<='0'; 
		wait for 10 ns;


		clk<='1'; 
		wait for 10 ns;


		clk<='0'; 
		wait for 10 ns;

		clk<='1'; 
		wait for 10 ns;


		clk<='0'; 
		wait for 10 ns;

		clk<='1'; 
		wait for 10 ns;


		clk<='0'; 
		wait for 10 ns;
		clk<='1'; 
		wait for 10 ns;


		clk<='0'; 
		wait for 10 ns;
		clk<='1'; 
		wait for 10 ns;


		clk<='0'; 
		wait for 10 ns;
		clk<='1'; 
		wait for 10 ns;


		clk<='0'; 
		wait for 10 ns;
  	

      wait;
   end process;

END;
