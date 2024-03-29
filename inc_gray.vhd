library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;



entity inc_gray is
	generic(N : natural := 5);
	port
	(
		gray_in   : in std_logic_vector(n-1 downto 0);
		gray_out  : out std_logic_vector(n-1 downto 0)

	);
end entity;


architecture hardware of inc_gray is
	signal b: std_logic_vector(N-1 downto 0);
	signal soma: std_logic_vector(N-1 downto 0);
	
begin
	
   b(N-1) <= gray_in(N-1) xor '0';                       --gray to bin
    
   conversor: for i in N-2 downto 0 generate 
   b(i) <= gray_in(i) xor b(i+1);
	end generate;              
										                           -- em b agora tenho minha entrada em binario
										
	soma <= std_logic_vector(unsigned(b) + 1 );         -- tentando somar 1
	
	
   gray_out(N-1) <= soma(N-1) xor '0';                     -- bin to gray
    
   conversor2: for i in N-2 downto 0 generate       
   gray_out(i) <= soma(i) xor soma(i+1);
   end generate;                                               
	

end hardware;




