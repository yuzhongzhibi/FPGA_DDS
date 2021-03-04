library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-------------------------------------------------------------
--	this is a module used for control the key
-------------------------------------------------------------

entity KEY_CONTROL is
    Port ( CLK_IN : in  STD_LOGIC;
           KEY : in  STD_LOGIC_VECTOR (2 downto 0);
           F_CTRL : out  STD_LOGIC_VECTOR (7 downto 0));
end KEY_CONTROL;

architecture Behavioral of KEY_CONTROL is
	-- K : frenquence word initialize
	signal K : STD_LOGIC_VECTOR(7 downto 0) := "01100100";
	--the last state of KEY(0), KEY(1)
	signal key0, key1 : STD_LOGIC := '0';
begin

	process(CLK_IN, KEY)
   begin
		if CLK_IN' event and CLK_IN = '1' then 
			--founction reset 10KHz
			if KEY(2) = '1' then
				K <= "01100100";
			else
				--founction add
				if KEY(0) = '1' and key0 = '0' then
					if K < "11001000" then
						K <= K + "00000001";
					else
						K <= "11001000";
					end if;
					key0 <= '1';
				elsif KEY(0) = '0' then
					key0 <= '0';
				end if;
				--founction sub
				if KEY(1) = '1' and key1 = '0' then
					if K > "00000000" then
						K <= K - "00000001";
					else
						K <= "00000000";
					end if;
					key1 <= '1';
				elsif KEY(1) = '0' then
					key1 <= '0';
				end if;
			end if;
		end if;
	end process;
	F_CTRL <= K;
	
end Behavioral;

