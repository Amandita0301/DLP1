library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity gray2onehot is
	generic (n: natural :=	4);

	port(
	     gray   : IN STD_LOGIC_VECTOR (N-1 DOWNTO 0);
        oneHot : OUT STD_LOGIC_VECTOR(2**N-1 DOWNTO 0)
		  );

end gray2onehot;


architecture hardware of gray2onehot is
     signal bin : std_LOGIC_VECTOR(N-1 DOWNTO 0);
	  signal num : natural range 0 to 2**N-1;

begin

		bin(N-1) <= bin(N-1) xor '0';               --converti para binario
   conversor: for i in N-2 downto 0 generate 
      bin(i) <= gray(i) xor bin(i+1);
	   end generate;
		
	   num <= to_integer(unsigned(bin));           --converti para inteiro
		
	gerador2:             
		for i in 2 ** (N-1) downto 0 generate       --percorri o binario olhando onde tinha 1 
		oneHot(i) <= '1' when (i = num) else '0';
		end generate;

end hardware;
