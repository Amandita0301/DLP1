LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY serialTOParalela IS
	GENERIC(N : NATURAL := 10);
  PORT ( clk, rst: IN STD_LOGIC;
   din: in STD_LOGIC;
   qout: OUT STD_LOGIC_vector(0 to n-1));
 END;
 
 -- Descrição de como o circuito deve funcionar
 ARCHITECTURE hardware OF  serialTOParalela  IS
	signal d,q : std_logic_vector(0 to n-1);   
                                            
 BEGIN
  PROCESS (clk, rst)
  BEGIN
   IF not(rst='1') THEN
    q <= (others => '0');
   ELSIF (rising_edge(clk)) THEN
    q <= din & q(0 to n-2);                --concatenando, pra colocar din no inicio
   END IF;
  END PROCESS;
  qout <= q;
 END hardware;
 
 
