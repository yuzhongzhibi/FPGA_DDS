library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-------------------------------------------------------------
--	this is a module to adjust the wave
-------------------------------------------------------------


entity WAVE_ADOPT is
    Port ( WAVE_IN : in  STD_LOGIC_VECTOR (7 downto 0);
           WAVE_OUT : out  STD_LOGIC_VECTOR (7 downto 0));
end WAVE_ADOPT;

architecture Behavioral of WAVE_ADOPT is

begin
	
	WAVE_OUT <= (not WAVE_IN(7))&WAVE_IN(6 downto 0);

end Behavioral;

