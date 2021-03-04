--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:54:04 01/07/2021
-- Design Name:   
-- Module Name:   E:/Code/ISE/DDS/simulation/sin_wave_sim.vhd
-- Project Name:  DDS
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: SIN_WAVE
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
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY sin_wave_sim IS
END sin_wave_sim;
 
ARCHITECTURE behavior OF sin_wave_sim IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SIN_WAVE
    PORT(
         clk : IN  std_logic;
         phase_in : IN  std_logic_vector(9 downto 0);
         sine : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal phase_in : std_logic_vector(9 downto 0) := (others => '0');

 	--Outputs
   signal sine : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SIN_WAVE PORT MAP (
          clk => clk,
          phase_in => phase_in,
          sine => sine
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 10 ns;	
		for i in 0 to 10 loop
			phase_in <= phase_in + "00000001";
			wait for 20 ns;
		end loop;
     
      wait;
   end process;

END;
