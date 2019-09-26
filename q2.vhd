library ieee;
use ieee.std_logic_1164.all;

entity q2 is
	
	port
	(
		a,b	: in  bit;
		
		x,y   : out bit
		
	);
end q2;


architecture hardware of q2 is
	
	signal a2, a3 : bit;
	
	attribute keep : boolean;
	attribute keep of a2,a3 : signal is true;
	
begin

	a2 <= not a;
	a3 <= not a2;
	
	x <= (not b and a and a3);
	
	y <= (a and a3 and b);


end hardware;
