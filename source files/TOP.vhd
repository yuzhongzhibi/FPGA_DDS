library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-------------------------------------------------------------
--	this is the top module
-------------------------------------------------------------

entity TOP is
    Port ( CLK : in  STD_LOGIC;
			  KEY : in 	STD_LOGIC_VECTOR (2 downto 0);
           DIG : out  STD_LOGIC_VECTOR (7 downto 0);
           SEG : out  STD_LOGIC_VECTOR (7 downto 0);
           WAVE : out  STD_LOGIC_vector (7 downto 0));
end TOP;

architecture Behavioral of TOP is
	--declaration
	component CLK_DIV is
		 Port ( CLK_IN : in  STD_LOGIC;
				  CLK_OUT1 : out  STD_LOGIC;
				  CLK_OUT2 : out  STD_LOGIC);
	end component;
	
	component DYNAMIC_LED is
		 Port ( CLK_IN : in  STD_LOGIC;
				  BCD_0 : in  STD_LOGIC_VECTOR (3 downto 0);
				  BCD_1 : in  STD_LOGIC_VECTOR (3 downto 0);
				  BCD_2 : in  STD_LOGIC_VECTOR (3 downto 0);
				  DIG : out  STD_LOGIC_VECTOR (7 downto 0);
				  SEG : out  STD_LOGIC_VECTOR (7 downto 0));
	end component;
	
	component ENCODER is
		 Port ( CLK_IN : in  STD_LOGIC;
				  F_CTRL : in  STD_LOGIC_VECTOR (7 downto 0);
				  BCD_0 : out  STD_LOGIC_VECTOR (3 downto 0);
				  BCD_1 : out  STD_LOGIC_VECTOR (3 downto 0);
				  BCD_2 : out  STD_LOGIC_VECTOR (3 downto 0));
	end component;
	
	component KEY_CONTROL is
		 Port ( CLK_IN : in  STD_LOGIC;
				  KEY : in  STD_LOGIC_VECTOR (2 downto 0);
				  F_CTRL : out  STD_LOGIC_VECTOR (7 downto 0));
	end component;

	component KEY_DEBOUNCE is
		 Port ( CLK_IN : in  STD_LOGIC;
				  KEY_IN : in  STD_LOGIC;
				  KEY_OUT : out  STD_LOGIC);
	end component;
	
	component SCAN_PHASE is
		 Port ( CLK_IN : in  STD_LOGIC;
				  F_CTRL : in  STD_LOGIC_VECTOR (7 downto 0);
				  PHASE_OUT : out  STD_LOGIC_VECTOR (9 downto 0));
	end component;
	
	component WAVE_ADOPT is
		 Port ( WAVE_IN : in  STD_LOGIC_VECTOR (7 downto 0);
				  WAVE_OUT : out  STD_LOGIC_VECTOR (7 downto 0));
	end component;
	
	component SIN_WAVE is
		 port ( CLK : in STD_LOGIC;
				  PHASE_IN : in STD_LOGIC_VECTOR (9 downto 0);
				  SINE : out STD_LOGIC_VECTOR (7 downto 0));
	end component;
	
	--clk1:102.5KHz clk2:1KHz
	signal clk1, clk2 : std_logic;
	--key after the debouncing
	signal key_db : std_logic_vector(2  downto 0);
	--f_word encode to BCD
	signal bcd0, bcd1, bcd2 : std_logic_vector (3 downto 0);
	
	signal f_word : std_logic_vector(7  downto 0);
	--phase after the addtion
	signal phase : std_logic_vector(9  downto 0);
	--wave from the ipcore
	signal s_wave : std_logic_vector(7  downto 0);
	
	--clear the ip component worning
	attribute box_type : string;
	attribute box_type of SIN_WAVE : component is "black_box";
	
begin
	--instantiation
	m1 : CLK_DIV port map(CLK, clk1, clk2);
	
	m2 : KEY_DEBOUNCE port map(clk2, KEY(0), key_db(0));
	m3 : KEY_DEBOUNCE port map(clk2, KEY(1), key_db(1));
	m4 : KEY_DEBOUNCE port map(clk2, KEY(2), key_db(2));
	
	m5 : KEY_CONTROL port map(clk2, key_db, f_word);
	
	m6 : ENCODER port map(clk2, f_word, bcd0, bcd1, bcd2);
	
	m7 : DYNAMIC_LED port map(clk2, bcd0, bcd1, bcd2, DIG, SEG);
	
	m8 : SCAN_PHASE port map(clk1, f_word, phase);
	
	m9 : SIN_WAVE port map(clk1, phase, s_wave);
	
	m10 : WAVE_ADOPT port map(s_wave, WAVE);
	
end Behavioral;

