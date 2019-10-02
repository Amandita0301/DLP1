LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

 
ENTITY somadorSubtratorOP IS
	GENERIC (N : NATURAL := 4);
	PORT (
		a,b	  : IN STD_LOGIC_VECTOR (N-1 DOWNTO 0);
		soma, sub   : OUT STD_LOGIC_VECTOR (N DOWNTO 0));
END somadorSubtratorOP;
 
-- Versão que realiza a soma diretamente, mas que precisa modificar o código de acordo com o número de entradas.
 
ARCHITECTURE hardware OF somadorSubtratorOP IS
	SIGNAL a_sig, b_sig, soma_sig : SIGNED (N DOWNTO 0);
	
BEGIN
	a_sig <= RESIZE(SIGNED(a), N + 1); --colocando um bit a mais na entrada
	b_sig <= RESIZE(SIGNED(b), N + 1);
	
	sub_sig <=  a_sig - b_sig;
	
	soma_sig <= a_sig + b_sig;
	soma <= STD_LOGIC_VECTOR(soma_sig);
	sub <= std_LOGIC_VECTOR(sub_sig);
		
END hardware;
 