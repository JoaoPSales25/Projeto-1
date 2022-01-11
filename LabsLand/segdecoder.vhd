LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY segdecoder IS
PORT (

	--Insert input ports below
	I : IN std_logic_vector(3 downto 0);

	
	--Insert output ports below
	s : OUT std_logic_vector(6 downto 0)
	);

END segdecoder;

--Complete your VHDL description below
--------------------------------------------------------------------------------
ARCHITECTURE TypeArchitecture OF segdecoder IS



BEGIN

	S <= "1000000" when I="0000" else -- "0"
		"1111001" when I="0001" else -- "1"
		"0100100" when I="0010" else -- "2"
		"0110000" when I="0011" else -- "3"
		"0011001" when I="0100" else -- "4"
		"0010010" when I="0101" else -- "5"
		"0000010" when I="0110" else -- "6"
		"1111000" when I="0111" else -- "7"
		"0000000" when I="1000" else -- "8"
		"0010000" when I="1001" else -- "9"
		"0001000" when I="1010" else -- "10"
		"0000011" when I="1011" else -- "11"
		"1000110" when I="1100" else -- "12"
		"0100001" when I="1101" else -- "13"
		"0000110" when I="1110" else -- "14"
		"0001110" when I="1111" else -- "15"
		"1111111" ;


END TypeArchitecture;