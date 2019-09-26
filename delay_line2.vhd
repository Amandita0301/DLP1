entity delay_line2 is
	port(x : in bit;
			y : out bit);
end entity;

architecture example of delay_line2 is
  SIGNAL A,B,C : BIT;
  ATTRIBUTE KEEP : boolean;
  ATTRIBUTE keep of a,b,c : signal is true;  --true or false, essa linha funciona ou nao
begin

	a<= not x;
	b<= not a;
	c<= x;
	y<= c xor b;
	
end architecture;