--------------------------------------------------------------------------------
-- Project : xor_fun
-- Autor   :  João Pedro de Faria e Bryan josé
-- Date    : 12/12/21
--
--------------------------------------------------------------------------------
-- Description : projeto da função xor entre 2 números de 4 bits
--
--------------------------------------------------------------------------------


LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY xor_fun IS
  PORT (
  ------------------------------------------------------------------------------
  --Insert input ports below
    a        : IN  std_logic_vector(3 DOWNTO 0); 
    b        : IN  std_logic_vector(3 DOWNTO 0); 

  ------------------------------------------------------------------------------
  --Insert output ports below
       output        : OUT std_logic_vector(3 DOWNTO 0)  
    );
END xor_fun;



ARCHITECTURE TypeArchitecture OF xor_fun IS

BEGIN
 
 -- faz a operação xor bit a bit e concatena eles
output <= (a(3) xor b(3)) & (a(2) xor b(2)) & (a(1) xor b(1)) & (a(0) xor b(0)) ;

END TypeArchitecture;
