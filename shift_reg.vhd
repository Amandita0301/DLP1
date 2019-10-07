LIBRARY ieee;
USE ieee.std_logic_1164.all;
 
 -- Especificação de todas as entradas e saídas do circuito
 ENTITY shift_reg IS
	GENERIC(N : NATURAL := 4);
  PORT ( clk, rst: IN STD_LOGIC;
   din: in STD_LOGIC;
   dout: OUT STD_LOGIC);
 END;
 
 -- Descrição de como o circuito deve funcionar
 ARCHITECTURE hardware OF  shift_reg IS
	signal d,q : std_logic_vector(0 to n-1);   
 
                                              
 BEGIN
 l2: for i in d'range generate
  PROCESS (clk, rst)
  BEGIN
   IF (rst='1') THEN
    q(i) <= '0';
   ELSIF (rising_edge(clk)) THEN
    q(i) <= d(i);
   END IF;
  END PROCESS;
  end generate;
  d(0) <= din;
  d(1) <= q(0);
  d(2) <= q(1);
  d(3) <= q(2);
  dout <= q(3);
  
 END hardware;
 
-- q(0 to 3 <= din & q(0to 2)