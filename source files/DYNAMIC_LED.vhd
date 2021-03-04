library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-------------------------------------------------------------
--	this is a module contrl the digital led
-------------------------------------------------------------

entity DYNAMIC_LED is
    Port ( CLK_IN : in  STD_LOGIC;
           BCD_0 : in  STD_LOGIC_VECTOR (3 downto 0);
           BCD_1 : in  STD_LOGIC_VECTOR (3 downto 0);
           BCD_2 : in  STD_LOGIC_VECTOR (3 downto 0);
           DIG : out  STD_LOGIC_VECTOR (7 downto 0);
           SEG : out  STD_LOGIC_VECTOR (7 downto 0));
end DYNAMIC_LED;

architecture Behavioral of DYNAMIC_LED is
	--counter
	signal count : integer range 0 to 2 := 0;
	--temp bcd code
	signal bcd_temp : std_logic_vector(3 downto 0) := "0000";

begin
	--counter
	process(CLK_IN) is
	begin
		if CLK_IN' event and CLK_IN = '1' then
			if count = 2 then
				count <= 0;
			else
				count <= count + 1;
			end if;
		end if;
	end process;
	--dig and data choose
	process(CLK_IN, count) is
	begin
		if CLK_IN' event and CLK_IN = '1' then
			case count is
				when 0 =>
					--hundred bit
					DIG <= "11110111";
					bcd_temp <= BCD_2;
				when 1 =>
					--ten bit
					DIG <= "11111101";
					bcd_temp <= BCD_1;
				when 2 =>
					--one bit
					DIG <= "11111011";
					bcd_temp <= BCD_0;
				when others =>
					DIG <= "00000000";
			end case;
		end if;
	end process;
	--decoder the BCD to 7-seg digital led
	process(CLK_IN, bcd_temp)
	begin
		if CLK_IN' event and CLK_IN = '1' then
			--bits show the number of points
			if count = 2 then
				case bcd_temp is
					when "0000" =>
						SEG <= "01000000";
					when "0001" =>
						SEG <= "01111001";
					when "0010" =>
						SEG <= "00100100";
					when "0011" =>
						SEG <= "00110000";
					when "0100" =>
						SEG <= "00011001";
					when "0101" =>
						SEG <= "00010010";
					when "0110" =>
						SEG <= "00000010";
					when "0111" =>
						SEG <= "01111000";
					when "1000" =>
						SEG <= "00000000";
					when "1001" =>
						SEG <= "00010000";
					when others =>
						SEG <= "00000000";
				end case;
			else 
				case bcd_temp is
					when "0000" =>
						SEG <= "11000000";
					when "0001" =>
						SEG <= "11111001";
					when "0010" =>
						SEG <= "10100100";
					when "0011" =>
						SEG <= "10110000";
					when "0100" =>
						SEG <= "10011001";
					when "0101" =>
						SEG <= "10010010";
					when "0110" =>
						SEG <= "10000010";
					when "0111" =>
						SEG <= "11111000";
					when "1000" =>
						SEG <= "10000000";
					when "1001" =>
						SEG <= "10010000";
					when others =>
						SEG <= "00000000";
				end case;
			end if;
		end if;
	end process;

end Behavioral;

