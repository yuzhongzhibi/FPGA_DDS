--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:07:00 01/07/2021
-- Design Name:   
-- Module Name:   E:/Code/ISE/DDS/simulation/dynamic_led_sim.vhd
-- Project Name:  DDS
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: DYNAMIC_LED
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
 
ENTITY dynamic_led_sim IS
END dynamic_led_sim;
 
ARCHITECTURE behavior OF dynamic_led_sim IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DYNAMIC_LED
    PORT(
         CLK_IN : IN  std_logic;
         BCD_0 : IN  std_logic_vector(3 downto 0);
         BCD_1 : IN  std_logic_vector(3 downto 0);
         BCD_2 : IN  std_logic_vector(3 downto 0);
         DIG : OUT  std_logic_vector(7 downto 0);
         SEG : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK_IN : std_logic := '0';
   signal BCD_0 : std_logic_vector(3 downto 0) := (others => '0');
   signal BCD_1 : std_logic_vector(3 downto 0) := (others => '0');
   signal BCD_2 : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal DIG : std_logic_vector(7 downto 0);
   signal SEG : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant CLK_IN_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DYNAMIC_LED PORT MAP (
          CLK_IN => CLK_IN,
          BCD_0 => BCD_0,
          BCD_1 => BCD_1,
          BCD_2 => BCD_2,
          DIG => DIG,
          SEG => SEG
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
      -- hold reset state for 100 ns
      wait for 100 ns;	
		BCD_0 <= "0011";
		BCD_1 <= "0010";
		BCD_2 <= "0001";

      wait;
   end process;

END;
