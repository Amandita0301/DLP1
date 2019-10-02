library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity contador is
	
	port
	(
		clk, rst_a	   : in  std_logic;
		conta_s	      : out std_logic_vector(2 downto 0)
		
	);
end contador;

architecture hardware of contador is
	
begin
L1:
	process(clk,rst_a) is
		variable conta : integer range 0 to 7 :=0;  -- so pra simulaçao := 0
	begin
		if(rst_a = '1') then
			conta:= 0;    --garante que vai comecar em zero
		-- rising edge == a usar event, o recomendado e o rising
		elsif (rising_edge(clk))then --coloco isso nao precisa do else, nao faz latch
			conta:= conta + 1;
		end if;
	conta_s <= std_logic_vector(to_unsigned(conta,3)); 
	end process;
end hardware;
