LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY alarme_vhd_tst IS
END alarme_vhd_tst;
ARCHITECTURE alarme_arch OF alarme_vhd_tst IS
-- constants  
constant tclk: time := 1 ns;  
constant treset: time := 100 ps;                                             
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL remote : STD_LOGIC;
SIGNAL rst : STD_LOGIC;
SIGNAL sensores : STD_LOGIC;
SIGNAL siren : STD_LOGIC;
COMPONENT alarme
	PORT (
	clk : IN STD_LOGIC;
	remote : IN STD_LOGIC;
	rst : IN STD_LOGIC;
	sensores : IN STD_LOGIC;
	siren : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : alarme
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	remote => remote,
	rst => rst,
	sensores => sensores,	
	siren => siren
	);

sim_clk:PROCESS                                              
BEGIN  
  clk <= '1';
  wait for tclk;
  clk <= '0';
  wait for tclk;
END PROCESS;

sim_rst:PROCESS                                              
BEGIN  
  rst <= '1';
  wait for treset;
  rst <= '0';
  wait;
END PROCESS;

sim_remote: remote <= '0', '1' after 3 ns, '0' after 5 ns, '1' after 7 ns;	

sim_sensores: sensores <= '0', '1' after 10 ns, '0' after 15 ns, '1' after 20 ns;	
		
	
END alarme_arch;
