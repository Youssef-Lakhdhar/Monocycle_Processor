LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY banc_registres_tb IS
END ENTITY;

ARCHITECTURE bench OF banc_registres_tb IS
	SIGNAL Rw,Ra,Rb: std_logic_vector(3 DOWNTO 0);
	SIGNAL W,A,B: std_logic_vector(31 DOWNTO 0);
	SIGNAL WE,Rst: std_logic;
	SIGNAL CLK: std_logic := '0';
BEGIN
Rst <= '0';
WE <= '1';

PROCESS
BEGIN
Clk <= not Clk;
WAIT FOR 1 NS;
END PROCESS;

PROCESS
BEGIN
Ra <= "1111"; -- A = R(15)
WAIT FOR 10 NS;
W <= X"00FF0F12"; 
Rw <= "0101"; -- R(6) = 16715538
WAIT FOR 10 NS;
Rw <= "1101"; -- R(13) = 16715538
WAIT FOR 10 NS;
Rb <= "1101"; -- B = R(13)
WAIT FOR 10 NS;
END PROCESS;

banc_registres: ENTITY work.banc_registres(behav) PORT MAP(Rw,Ra,Rb,WE,Clk,Rst,W,A,B);

END ARCHITECTURE;
