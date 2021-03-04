--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:16:59 01/06/2021
-- Design Name:   
-- Module Name:   E:/Code/ISE/DDS/simulation/key_ctrl_sim.vhd
-- Project Name:  DDS
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: KEY_CONTROL
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
 
ENTITY key_ctrl_sim IS
END key_ctrl_sim;
 
ARCHITECTURE behavior OF key_ctrl_sim IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT KEY_CONTROL
    PORT(
         CLK_IN : IN  std_logic;
         KEY : IN  std_logic_vector(2 downto 0);
         F_CTRL : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK_IN : std_logic := '0';
   signal KEY : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal F_CTRL : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant CLK_IN_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: KEY_CONTROL PORT MAP (
          CLK_IN => CLK_IN,
          KEY => KEY,
          F_CTRL => F_CTRL
        );

   -- Clock process definitions
   CLK_IN_process :process
   begin
		CLK_IN <= '0';
		wait for CLK_IN_period/2;
		CLK_IN <= '1';
		wait for CLK_IN_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin			
		KEY <= "001";
      wait for 50 ns;
		KEY <= "000";
      wait for 50 ns;
   end process;

END;
