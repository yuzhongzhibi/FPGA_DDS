library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-------------------------------------------------------------
--	this is a module encode bitarrary to 8421BCD
-------------------------------------------------------------

entity ENCODER is
    Port ( CLK_IN : in  STD_LOGIC;
           F_CTRL : in  STD_LOGIC_VECTOR (7 downto 0);
           BCD_0 : out  STD_LOGIC_VECTOR (3 downto 0);
           BCD_1 : out  STD_LOGIC_VECTOR (3 downto 0);
           BCD_2 : out  STD_LOGIC_VECTOR (3 downto 0));
end ENCODER;

architecture Behavioral of ENCODER is
	--Clocked Synchronous State Machine
	signal state : std_logic_vector (2 downto 0) := "000";
	--read the frequence word
	signal f_temp : std_logic_vector (7 downto 0);
	--store the BCD code
	signal bcd_temp0 : std_logic_vector (3 downto 0);
	signal bcd_temp1 : std_logic_vector (3 downto 0);
	signal bcd_temp2 : std_logic_vector (3 downto 0);

begin

	process(CLK_IN) is
	begin
		if CLK_IN' event and CLK_IN = '1' then
			case state is
				when "000" =>
					--initialize
					f_temp <= F_CTRL;
					bcd_temp0 <= "0000";
					bcd_temp1 <= "0000";
					bcd_temp2 <= "0000";
					state <= "001";
				when "001" =>
					--get a hundred bit to BCD
					if f_temp >= "01100100" then
						f_temp <= f_temp - "01100100";
						bcd_temp2 <= bcd_temp2+1;
						state <= "001";
					else
						state <= "010";
					end if;
				when "010" =>
					--get a ten bit to BCD
					if f_temp >= "00001010" then
						f_temp <= f_temp - "00001010";
						bcd_temp1 <= bcd_temp1+1;
						state <= "010";
					else
						state <= "011";
					end if;
				when "011" =>
					--get one bit to BCD
					if f_temp >= "00000001" then
						f_temp <= f_temp - "00000001";
						bcd_temp0 <= bcd_temp0+1;
						state <= "011";
					else
						state <= "100";
					end if;
				when "100" =>
					--output
					BCD_0 <= bcd_temp0;
					BCD_1 <= bcd_temp1;
					BCD_2 <= bcd_temp2;
					--cycle the state
					state <= "000";
				when others =>
					state <= "000";
			end case;
		end if;
	end process;

end Behavioral;

