LIBRARY ieee;
USE ieee.std_logic_1164.all;
 
 -- Especificação de todas as entradas e saídas do circuito
 ENTITY shift_reg IS
	GENERIC(N : NATURAL := 10);
  PORT ( clk, rst: IN STD_LOGIC;
   din: in STD_LOGIC;
   dout: OUT STD_LOGIC);
 END;
 
 -- Descrição de como o circuito deve funcionar
 ARCHITECTURE hardware OF  shift_reg IS
	signal d,q : std_logic_vector(0 to n-1);   
                                            
 BEGIN
  PROCESS (clk, rst)
  BEGIN
   IF not(rst='1') THEN
    q <= (others => '0');
   ELSIF (rising_edge(clk)) THEN
    q <= din & q(0 to n-2);    --concatenando, pra colocar din no inicio
   END IF;
  END PROCESS;
  dout <= q(n-1);
 END hardware;
 
 

