--------------------------------------------------------------------------------
-- Project : and_gate
-- Autor   : João Pedro de Faria e Bryan josé
-- Date    : 12/12/21
--
--------------------------------------------------------------------------------
-- Description : projeto da função AND entre 2 números de 4 bits
--
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY and_f IS
  PORT (
  ------------------------------------------------------------------------------
  --Insert input ports below
    a        : IN  std_logic_vector(3 DOWNTO 0); 
    b        : IN  std_logic_vector(3 DOWNTO 0); 

  ------------------------------------------------------------------------------
  --Insert output ports below
       output        : OUT std_logic_vector(3 DOWNTO 0)  
    );
END and_f;


ARCHITECTURE TypeArchitecture OF and_f IS

BEGIN

	--compara bit a bit
	output <= (a(3) and b(3)) & (a(2) and b(2)) & (a(1) and b(1)) & (a(0) and b(0)) ;

END TypeArchitecture;
