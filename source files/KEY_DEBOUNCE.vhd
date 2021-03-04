library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-------------------------------------------------------------
--	this is a module used for debouncing a key
-------------------------------------------------------------

entity KEY_DEBOUNCE is
    Port ( CLK_IN : in  STD_LOGIC;
			  KEY_IN : in  STD_LOGIC;
           KEY_OUT : out  STD_LOGIC);
end KEY_DEBOUNCE;

architecture Behavioral of KEY_DEBOUNCE is
	--time delay count 20*1 ms
 	signal count : integer range 1 to 20;
	
begin

	process(CLK_IN) is
	begin
		if CLK_IN' event and CLK_IN = '1' then
			if KEY_IN = '0' then
				KEY_OUT <= '0';
				count <= 1;
			else
				if count = 20 then
					KEY_OUT <= '1';
					count <= 1;
				else
					count <= count + 1;
				end if;
			end if;
		end if;
	end process;
	
end Behavioral;

