LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

 
ENTITY somador IS
	GENERIC (N : NATURAL := 4);
	PORT (
		a,b	  : IN STD_LOGIC_VECTOR (N-1 DOWNTO 0);
		soma    : OUT STD_LOGIC_VECTOR (N DOWNTO 0));
END somador;
 
-- Versão que realiza a soma diretamente, mas que precisa modificar o código de acordo com o número de entradas.
 
ARCHITECTURE hardware OF somador IS
	SIGNAL a_uns : UNSIGNED (N DOWNTO 0);
	SIGNAL b_uns : UNSIGNED (N DOWNTO 0);
	SIGNAL soma_uns : UNSIGNED (N DOWNTO 0);
BEGIN
	a_uns <= RESIZE(UNSIGNED(a), N + 1); --colocando um bit a mais na entrada
	b_uns <= RESIZE(UNSIGNED(b), N + 1);
	
	soma_uns <= a_uns + b_uns;
	soma <= STD_LOGIC_VECTOR(soma_uns);
		
END hardware;
 