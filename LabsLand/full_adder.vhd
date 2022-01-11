--------------------------------------------------------------------------------
-- Project : full_adder
-- Autor    : João Pedro de Faria e Bryan josé
-- Date    :12/12/21
--
--------------------------------------------------------------------------------
-- Description : projeto de um somador de 2 numeros de 4 bits
--
--------------------------------------------------------------------------------


LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY full_adder IS
  PORT (
  ------------------------------------------------------------------------------
  --Insert input ports below
    carry_i      : IN  std_logic;                    
    Aval_i        : IN  std_logic_vector(3 DOWNTO 0); 
	Bval_i        : IN  std_logic_vector(3 DOWNTO 0);
  ------------------------------------------------------------------------------
  --Insert output ports below
    carry_o        : OUT std_logic;                    
    Sval_o        : OUT std_logic_vector(3 DOWNTO 0) 
    );
END full_adder;

--------------------------------------------------------------------------------
--Complete your VHDL description below
--------------------------------------------------------------------------------

ARCHITECTURE TypeArchitecture OF full_adder IS


signal a : std_logic;
signal p : std_logic_vector(3 downto 0);
signal g : std_logic_vector(3 downto 0);
signal c : std_logic_vector(3 downto 0);

BEGIN

	-- descrição de um full adder de 4 bits
	p <= Aval_i xor Bval_i;
	g <= Aval_i and bval_i;
	c(0) <= carry_i;
	c(1) <= (p(0) and c(0)) or g(0);
	c(2) <= (p(1) and ((p(0) and c(0)) or g(0))) or g(1);
	c(3) <= (p(2) and ((p(1) and ((p(0) and c(0)) or g(0))) or g(1))) or g(2);
	carry_o <= (p(3) and ((p(2) and ((p(1) and ((p(0) and c(0)) or g(0))) or g(1))) or g(2))) or g(3);
	
	sval_o <= p xor c;

END TypeArchitecture;
