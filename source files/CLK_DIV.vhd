library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-------------------------------------------------------------
--	this is a module used for dividing clock
-------------------------------------------------------------

entity CLK_DIV is
    Port ( CLK_IN : in  STD_LOGIC;
           CLK_OUT1 : out  STD_LOGIC;
           CLK_OUT2 : out  STD_LOGIC);
end CLK_DIV;

architecture Behavioral of CLK_DIV is
	--output clk 102.5KHz
	signal count1 : integer range 0 to 234 := 0;
	signal clk_temp1 : STD_LOGIC := '0';
	--output clk 1KHz
	signal count2 : integer range 0 to 24000 := 0;
	signal clk_temp2 : STD_LOGIC := '0';

begin
	--counting for 102.5KHz
	process(CLK_IN) is
	begin
		if CLK_IN' event and CLK_IN = '1' then
			if count1 = 234 then
				count1 <= 1;
				clk_temp1 <= not clk_temp1;
			else
				count1 <= count1 + 1;
			end if;
		end if;
	end process;
	--counting for 1KHz
	process(CLK_IN) is
	begin
		if CLK_IN' event and CLK_IN = '1' then
			if count2 = 24000 then
				count2 <= 1;
				clk_temp2 <= not clk_temp2;
			else
				count2 <= count2 + 1;
			end if;
		end if;
	end process;
	--output
	CLK_OUT1 <= clk_temp1;
	CLK_OUT2 <= clk_temp2;
end Behavioral;

