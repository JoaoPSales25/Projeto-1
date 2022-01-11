--------------------------------------------------------------------------------
-- Project : DeslocadorEsquerda
-- Autor   :  João Pedro de Faria e Bryan josé
-- Date    : 12/12/21
--
--------------------------------------------------------------------------------
-- Description : projeto da função de deslocador à direita de um número de 4 bits
--
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY DeslocadorEsquerda IS
  PORT (
    a        : IN  std_logic_vector(3 DOWNTO 0); -- 
  ------------------------------------------------------------------------------
  --Insert output ports below
       output        : OUT std_logic_vector(3 DOWNTO 0)  -- 
    );
END DeslocadorEsquerda;



ARCHITECTURE TypeArchitecture OF DeslocadorEsquerda IS

BEGIN

-- desloca os bits a esquerda
 output <= a(2 downto 0)&'0';

END TypeArchitecture;
