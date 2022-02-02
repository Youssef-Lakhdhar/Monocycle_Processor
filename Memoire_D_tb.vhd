LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY Memoire_D_tb IS
END ENTITY;

ARCHITECTURE bench OF Memoire_D_tb IS
	SIGNAL Rst,Clk,WE: std_logic := '0';
	SIGNAL DataIn,DataOut: std_logic_vector(31 DOWNTO 0);
	SIGNAL Addr: std_logic_vector(5 DOWNTO 0);
BEGIN

PROCESS
BEGIN
Clk <= not Clk;
WAIT FOR 1 NS;
END PROCESS;

PROCESS
BEGIN
WE <= '1';
Addr <= "000011";
WAIT FOR 10 NS;
DataIn <= X"00FF0F12";
Addr <= "111101";
WAIT FOR 10 NS;
DataIn <= X"1100FECD";
Addr<= "011101";
WAIT FOR 10 NS;
WE <= '0';
WAIT FOR 10 NS;
WE <= '1';
DataIn <= X"0F11E359";
Addr <= "110011";
WAIT FOR 10 NS;
END PROCESS;

Memoire_D: ENTITY work.Memoire_D(behav) PORT MAP (Rst,Clk,WE,Addr,DataIn,DataOut);

END ARCHITECTURE;