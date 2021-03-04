--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:28:41 01/07/2021
-- Design Name:   
-- Module Name:   E:/Code/ISE/DDS/simulation/encoder_sim.vhd
-- Project Name:  DDS
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ENCODER
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
 
ENTITY encoder_sim IS
END encoder_sim;
 
ARCHITECTURE behavior OF encoder_sim IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ENCODER
    PORT(
         CLK_IN : IN  std_logic;
         F_CTRL : IN  std_logic_vector(7 downto 0);
         BCD_0 : OUT  std_logic_vector(3 downto 0);
         BCD_1 : OUT  std_logic_vector(3 downto 0);
         BCD_2 : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK_IN : std_logic := '0';
   signal F_CTRL : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal BCD_0 : std_logic_vector(3 downto 0);
   signal BCD_1 : std_logic_vector(3 downto 0);
   signal BCD_2 : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant CLK_IN_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ENCODER PORT MAP (
          CLK_IN => CLK_IN,
          F_CTRL => F_CTRL,
          BCD_0 => BCD_0,
          BCD_1 => BCD_1,
          BCD_2 => BCD_2
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
		wait for 20 ns;
      F_CTRL <= "01111011";
   end process;

END;
