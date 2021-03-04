library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-------------------------------------------------------------
--	this is a module sum the phase
-------------------------------------------------------------

entity SCAN_PHASE is
    Port ( CLK_IN : in  STD_LOGIC;
           F_CTRL : in  STD_LOGIC_VECTOR (7 downto 0);
           PHASE_OUT : out  STD_LOGIC_VECTOR (9 downto 0));
end SCAN_PHASE;

architecture Behavioral of SCAN_PHASE is
	--one more bit to check isoverflowed
	signal phase : STD_LOGIC_VECTOR (10 downto 0) := "00000000000";

begin

	process(CLK_IN) is
	begin
		if CLK_IN' event and CLK_IN = '1' then
			if phase > "01111111111" then
				phase <= "00000000000";
			else
				phase <= phase + F_CTRL;
			end if;
		end if;
	end process;

	PHASE_OUT <= phase(9 downto 0);

end Behavioral;

