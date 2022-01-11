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

	S <= "1111110" when I="0000" else -- "0"
		"0110000" when I="0001" else -- "1"
		"1101101" when I="0010" else -- "2"
		"1111001" when I="0011" else -- "3"
		"0110011" when I="0100" else -- "4"
		"1011011" when I="0101" else -- "5"
		"1011111" when I="0110" else -- "6"
		"1110000" when I="0111" else -- "7"
		"1111111" when I="1000" else -- "8"
		"1111011" when I="1001" else -- "9"
		"0000000" ;


END TypeArchitecture;