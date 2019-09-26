library ieee;
use ieee.std_logic_1164.all;

entity gray2bin is
 
	generic (N : natural := 8 );
 
	port
	(
		gray   : in std_logic_vector(N -1 downto 0);
		bin  : buffer std_logic_vector(N -1 downto 0)
	);
 
end entity;
  
architecture hardware of gray2bin is
begin
gerador:
		for i in bin'left-1 downto 0 generate
		bin(i) <= gray(i) xor bin(i +1);
		end generate;
		bin(n-1) <= gray(n-1);
	
end architecture;
