--------------------------------------------------------------------------------
-- Project : or_fun
-- Autor   : João Pedro de Faria e Bryan josé
-- Date    : 12/12/21
--
--------------------------------------------------------------------------------
-- Description : projeto da função AND entre 2 números de 4 bits
--
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY or_f IS
  PORT (
  ------------------------------------------------------------------------------
  --Insert input ports below
    a        : IN  std_logic_vector(3 DOWNTO 0); 
    b        : IN  std_logic_vector(3 DOWNTO 0); 

  ------------------------------------------------------------------------------
  --Insert output ports below
       output        : OUT std_logic_vector(3 DOWNTO 0) 
    );
END or_f;



ARCHITECTURE TypeArchitecture OF or_f IS

BEGIN

	-- faz a operação OR bit a bit
	output <= (a(3) or b(3)) & (a(2) or b(2)) & (a(1) or b(1)) & (a(0) or b(0)) ;

END TypeArchitecture;
