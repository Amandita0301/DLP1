--Declaracao de bibliotecas e pacote

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;  --for arch1

--Entidade

ENTITY bin2bcd IS
    PORT (
        x_bin        : IN STD_LOGIC_VECTOR(13 DOWNTO 0);  --  0000 a 9999
		  m_bcd			: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);  --  milhar
        c_bcd        : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);  --  Centena
        d_bcd        : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);  --  Dezena
        u_bcd        : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)); --  Unidade
 
END bin2bcd;

-- Arquitetura

ARCHITECTURE hardware OF bin2bcd IS
    SIGNAL x_int : integer RANGE 0 TO 9999;     --Sinais auxiliares
	 SIGNAL m_int : integer RANGE 0 TO 9;
    SIGNAL c_int : integer RANGE 0 TO 9;
    SIGNAL d_int : integer RANGE 0 TO 9;
    SIGNAL u_int : integer RANGE 0 TO 9;
       
BEGIN		 
-- Descrição do hardware

    x_int <= To_Integer(Signed(x_bin));  -- De SLV para inteiro preciso passar por signed
	 m_int <= x_int/1000;                 -- m_int vai ficar com 9
	 
    c_int <= x_int/100;
    d_int <= (x_int/10) - (C_int*10);
    u_int <= x_int - ((C_int*10) + D_int)*10;
   
    m_bcd <= Std_logic_vector(To_Unsigned(m_int, 4));  --aqui eu volto para SLV 
    c_bcd <= Std_logic_vector(To_Unsigned(c_int, 4));
    d_bcd <= Std_logic_vector(To_Unsigned(d_int, 4));
    u_bcd <= Std_logic_vector(To_Unsigned(U_int, 4));
end hardware;