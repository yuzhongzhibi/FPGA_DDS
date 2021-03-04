--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:49:51 01/06/2021
-- Design Name:   
-- Module Name:   E:/Code/ISE/DDS/simulation/key_debounce_sim.vhd
-- Project Name:  DDS
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: KEY_DEBOUNCE
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
 
ENTITY key_debounce_sim IS
END key_debounce_sim;
 
ARCHITECTURE behavior OF key_debounce_sim IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT KEY_DEBOUNCE
    PORT(
         CLK_IN : IN  std_logic;
         KEY_IN : IN  std_logic;
         KEY_OUT : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLK_IN : std_logic := '0';
   signal KEY_IN : std_logic := '0';

 	--Outputs
   signal KEY_OUT : std_logic;

   -- Clock period definitions
   constant CLK_IN_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: KEY_DEBOUNCE PORT MAP (
          CLK_IN => CLK_IN,
          KEY_IN => KEY_IN,
          KEY_OUT => KEY_OUT
        );

   -- Clock process definitions
   CLK_IN_process :process
   begin
		CLK_IN <= '0';
		wait for CLK_IN_period/2;
		CLK_IN <= '1';
		wait for CLK_IN_period/2;
   end process;
	
	sim : process
	begin
		KEY_IN <= '0';
		wait for CLK_IN_period*2;
		KEY_IN <= '1';
		wait for CLK_IN_period*2;
		KEY_IN <= '0';
		wait for CLK_IN_period*2;
		KEY_IN <= '1';
		wait for CLK_IN_period*2;
		KEY_IN <= '0';
		wait for CLK_IN_period*2;
		KEY_IN <= '1';
		wait for 1000 ns;
	end process;
 

END;
