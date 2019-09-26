-- Declaração das bibliotecas e pacotes
 LIBRARY ieee;
 USE ieee.std_logic_1164.all;
 
 -- Especificação de todas as entradas e saídas do circuito
 ENTITY flip_flop IS
  PORT ( clk, rst: IN STD_LOGIC;
   d: in STD_LOGIC_VECTOR(numero downto 1));
   q: OUT STD_LOGIC_VECTOR(numero downto 1));
 END;
 
 -- Descrição de como o circuito deve funcionar
 ARCHITECTURE flip_flop OF flip_flop IS
 BEGIN
  PROCESS (clk, rst)
  BEGIN
   IF (rst='1') THEN
    q <= '0';
   ELSIF (clk'EVENT AND clk='1') THEN
    q <= d;
   END IF;
  END PROCESS;
 END;