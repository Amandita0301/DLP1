library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity resistores is 
	generic(R2 : integer := 10);
	port(
			R1     : in std_logic_vector(4 downto 0); -- 0 a 20
			Vin    : in std_logic_vector(9 downto 0); -- -500m a 500m
			sel    : in bit;
			i	    : out std_logic_vector(9 downto 0);	
			Vout	 : out std_logic_vector(14 downto 0)	
	
		);
	
end entity;

architecture hardware of resistores is	 
	 signal r1INT : integer range 0 to 20;
	 signal VinINT : integer range -500 to 500;
	 signal VoutINT : integer range -500 to 500;
	 signal iINT : integer range -500 to 500;
	 	 
begin
	r1INT <= to_integer(signed(R1));
	VinINT <= to_integer(signed(Vin));
	
	iINT <= VinINT / (r1INT + R2);   --corrente
	
	i <= std_logic_vector(to_signed(iINT, 10)); -- voltando pro inicial
	

	VoutINT <= (vinINT*r1INT) / (r1iNT + R2) when sel = '0' else
					
					(vinINT*R2) / (r1iNT + R2);
	
	Vout <= std_logic_vector(to_signed(VoutINT, 15));
	

end hardware;