--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:11:54 01/07/2021
-- Design Name:   
-- Module Name:   E:/Code/ISE/DDS/simulation/top_sim.vhd
-- Project Name:  DDS
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: TOP
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
 
ENTITY top_sim IS
END top_sim;
 
ARCHITECTURE behavior OF top_sim IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT TOP
    PORT(
         CLK : IN  std_logic;
         KEY : IN  std_logic_vector(2 downto 0);
         DIG : OUT  std_logic_vector(7 downto 0);
         SEG : OUT  std_logic_vector(7 downto 0);
         WAVE : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal KEY : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal DIG : std_logic_vector(7 downto 0);
   signal SEG : std_logic_vector(7 downto 0);
   signal WAVE : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: TOP PORT MAP (
          CLK => CLK,
          KEY => KEY,
          DIG => DIG,
          SEG => SEG,
          WAVE => WAVE
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 20 ns.
      wait for 20 ns;	
		KEY <= "000";
		wait for 20 ns;
		KEY <= "001";
		wait for 15 ms;
		KEY <= "000";
      wait;
		
   end process;

END;
