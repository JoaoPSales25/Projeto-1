
-- Testbench para a ALU
-- Autor:João Pedro Sales
-- Data: 12/12/2021

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity testbench is
end entity;

architecture s of testbench is
    signal x            :   unsigned(10 downto 0) := "00000000000";
    signal a_tb       :   std_logic_vector(3 downto 0);
	 signal b_tb       :   std_logic_vector(3 downto 0);
	 signal selec_tb       :   std_logic_vector(2 downto 0);


    signal saida_tb       :   std_logic_vector(3 downto 0);
	 signal carryout_tb       :   std_logic;
	 signal overflow_tb       :   std_logic;
	 signal zero_tb       :   std_logic;
	 signal negativo_tb       :   std_logic;
	 
	Component ALU_trab
	Port( 
		a        : IN  std_logic_vector(3 DOWNTO 0); 
      b        : IN  std_logic_vector(3 DOWNTO 0); 
    seletor  : IN  std_logic_vector(2 DOWNTO 0);

    saida        : OUT std_logic_vector(3 DOWNTO 0); 
    carryOut     : OUT std_logic;                    
    zero          : OUT std_logic;                    
    overflow      : OUT std_logic;                    
    negativo      : OUT std_logic 
		);
	end component;
	 
begin
	-- importa a ALU
    DUT: ALU_trab port map(a_tb, b_tb, selec_tb, saida_tb, carryout_tb, zero_tb , overflow_tb, negativo_tb);

	 -- a cada 100 nanosegundo soma 1 ao valor de x
    inc : process is
    begin

        wait for 100 ns;
        x <= x + 1;
        
    end process ; -- inc

	 -- o primeiro numero (a)recebe os 4 primeiros bits do valor de x (em binário)
	 -- o segundo numero (b) receber os proximos 4 bits de x
	 -- por fim o seletor recebe os ultimos 3
	 -- dessa forma podemos testar todas as combinações
	 
    a_tb <= std_logic_vector(x(3 downto 0));
	 b_tb <= std_logic_vector(x(7 downto 4));
	 selec_tb <= std_logic_vector(x(10 downto 8));

end architecture;