--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:13:58 01/07/2021
-- Design Name:   
-- Module Name:   E:/Code/ISE/DDS/simulation/wave_adopt_sim.vhd
-- Project Name:  DDS
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: WAVE_ADOPT
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
 
ENTITY wave_adopt_sim IS
END wave_adopt_sim;
 
ARCHITECTURE behavior OF wave_adopt_sim IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT WAVE_ADOPT
    PORT(
         WAVE_IN : IN  std_logic_vector(7 downto 0);
         WAVE_OUT : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal WAVE_IN : std_logic_vector(7 downto 0) := (others => '0');
	signal clk : std_logic := '0';
 	--Outputs
   signal WAVE_OUT : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant t : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: WAVE_ADOPT PORT MAP (
          WAVE_IN => WAVE_IN,
          WAVE_OUT => WAVE_OUT
        );

   -- Clock process definitions
   t_process :process
   begin
		clk <= '0';
		wait for t/2;
		clk <= '1';
		wait for t/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 10 ns;
		
		WAVE_IN <= "00001111";

      wait;
   end process;

END;
