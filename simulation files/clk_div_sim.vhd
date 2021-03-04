--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:14:43 01/06/2021
-- Design Name:   
-- Module Name:   E:/Code/ISE/DDS/simulation/clk_div_sim.vhd
-- Project Name:  DDS
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: CLK_DIV
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
 
ENTITY clk_div_sim IS
END clk_div_sim;
 
ARCHITECTURE behavior OF clk_div_sim IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CLK_DIV
    PORT(
         CLK_IN : IN  std_logic;
         CLK_OUT1 : OUT  std_logic;
         CLK_OUT2 : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLK_IN : std_logic := '0';

 	--Outputs
   signal CLK_OUT1 : std_logic;
   signal CLK_OUT2 : std_logic;

   -- Clock period definitions
   constant CLK_IN_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CLK_DIV PORT MAP (
          CLK_IN => CLK_IN,
          CLK_OUT1 => CLK_OUT1,
          CLK_OUT2 => CLK_OUT2
        );

   -- Clock process definitions
   CLK_IN_process :process
   begin
		CLK_IN <= '0';
		wait for CLK_IN_period/2;
		CLK_IN <= '1';
		wait for CLK_IN_period/2;
   end process;
 
END;
