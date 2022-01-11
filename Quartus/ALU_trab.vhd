--------------------------------------------------------------------------------
-- Project : ALU_trab
-- Autor   : João Pedro Sales e Brian José
-- Date    : 13/12
--
--------------------------------------------------------------------------------
-- Description : Circuito completo com as operações
--
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY ALU_trab IS
  PORT (
  ------------------------------------------------------------------------------
  --Insert input ports below
    a        : IN  std_logic_vector(3 DOWNTO 0); -- primeiro numero de 4 bits
    b        : IN  std_logic_vector(3 DOWNTO 0); --segundo numero de 4 bits
    seletor  : IN  std_logic_vector(2 DOWNTO 0); --chave de seleção para 8 operações
  ------------------------------------------------------------------------------
  --Insert output ports below
    saida        : OUT std_logic_vector(3 DOWNTO 0);  
    carryOut     : OUT std_logic;                   
    zero          : OUT std_logic;           -- '1' se o a saida for '0000'         
    overflow      : OUT std_logic;           --detecta '1' se houver overflow         
    negativo      : OUT std_logic           -- '1' se a saida for negativo            
    
    );
END ALU_trab;

    



ARCHITECTURE TypeArchitecture OF ALU_trab IS

--declaração de todos os modulos utilizados

Component and_f
	Port(a,b: IN  std_logic_vector(3 DOWNTO 0);
		output: OUT std_logic_vector(3 DOWNTO 0));
End Component;

Component or_f
	Port(a,b: IN  std_logic_vector(3 DOWNTO 0);
		output: OUT std_logic_vector(3 DOWNTO 0));
End Component;

Component xor_fun
	Port(a,b: IN  std_logic_vector(3 DOWNTO 0);
		output: OUT std_logic_vector(3 DOWNTO 0));
End Component;

Component DeslocadorEsquerda
	Port(a: IN  std_logic_vector(3 DOWNTO 0);
		output: OUT std_logic_vector(3 DOWNTO 0));
End Component;

Component full_adder
	Port(carry_i: IN  std_logic; 
		Aval_i, Bval_i: IN  std_logic_vector(3 DOWNTO 0);
		carry_o: out  std_logic;
		Sval_o: OUT std_logic_vector(3 DOWNTO 0)
		);
End component;
		
component segdecoder
	Port ( I : in std_logic_vector (3 downto 0);
			 S: out std_logic_vector (6 downto 0)
			 );
End component;

-- criação de um sinal para a saida de cada uma das operações
signal s_and :  std_logic_vector(3 DOWNTO 0);
signal s_or :  std_logic_vector(3 DOWNTO 0);
signal s_xor :  std_logic_vector(3 DOWNTO 0);
signal s_desloc :  std_logic_vector(3 DOWNTO 0);
signal s_soma :  std_logic_vector(3 DOWNTO 0);
signal s_sub :  std_logic_vector(3 DOWNTO 0);
signal s_incremento :  std_logic_vector(3 DOWNTO 0);
signal s_inverso :  std_logic_vector(3 DOWNTO 0);

-- sinais dos carrys de cada operação
signal carry_out_soma :  std_logic;
signal carry_out_sub :  std_logic;
signal carry_out_incremento :  std_logic;
signal carry_out_inverso :  std_logic;


--inversor de a e b para as funções subtração e inversão
signal not_a : std_logic_vector(3 DOWNTO 0);
signal not_b : std_logic_vector(3 DOWNTO 0);

-- sinal de saida
signal saida_f :  std_logic_vector(3 DOWNTO 0);


BEGIN
-- recebe o sinal invertido de a e b para as operações
not_a <= not(a(3))&not(a(2))&not(a(1))&not(a(0));
not_b <= not(b(3))&not(b(2))&not(b(1))&not(b(0));

-- faz o port map de cada modulo com os devidos parametros
f_AND: and_f PORT MAP(a, b, s_and);
f_OR: or_f PORT MAP(a,  b,  s_or);
f_xor: xor_fun PORT MAP( a, b, s_xor) ;
f_desloc: DeslocadorEsquerda PORT MAP( a,  s_desloc);
f_somador: full_adder PORT MAP( '0', a, b, carry_out_soma, s_soma);
f_subtrator: full_adder PORT MAP('1', a, not_b, carry_out_sub, s_sub);
f_incremento: full_adder PORT MAP('0', a, "0001", carry_out_incremento, s_incremento);
f_inverso: full_adder PORT MAP('0',not_a,"0001", carry_out_inverso, s_inverso);

-- escolhe qual saida deve ser recebida dependendo da chave de seleçao
	saida_f <= s_and when seletor ="000" else
			s_or when seletor ="001" else
			s_xor when seletor ="010" else
			s_desloc when seletor ="011" else
			s_soma when seletor ="100" else
			s_sub when seletor ="101" else
			s_incremento when seletor ="110" else
			s_inverso when seletor = "111" else
			"0000";
			
saida <= saida_f;

-- escolhe qual carry deve sair
carryout <=  carry_out_soma when seletor ="100" else
			carry_out_sub when seletor ="101" else
			carry_out_incremento when seletor ="110" else
			carry_out_inverso when seletor = "111" else
			'0';

-- função da saida zero
zero <= not(saida_f(0) or saida_f(1) or saida_f(2) or saida_f(3));

-- compara se os sinais dos numeros sao iguais e diferentes do sinal da saida
overflow <= (not(a(3)) and not(b(3)) and saida_f(3)) or (a(3) and b(3) and not(saida_f(3)));

-- testa se o numero é negativo (1 se for negativo e 0 se for positivo)
negativo <= saida_f (3);


END TypeArchitecture;
