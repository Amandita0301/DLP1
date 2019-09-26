library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity somadorSubtratorOP is
	generic (n: NATURAL := 6);
	port
	(
		op 	: in  std_logic;
		a, b  : in  std_logic_vector(n-1 downto 0);

		x     : out std_logic_vector(n-1 downto 0)
	);
end somadorSubtratorOP;


architecture hardware of somadorSubtratorOP is
	signal resultado: signed(n-1 downto 0);
	

begin

	  resultado <= signed(a) + signed(b) when op = '0' else
						signed(a) - signed(b);
	
	  x <= std_logic_vector(resultado);
	
end hardware;
