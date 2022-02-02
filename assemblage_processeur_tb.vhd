LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY assemblage_processeur_tb IS 
END ENTITY;

ARCHITECTURE bench OF assemblage_processeur_tb IS
	SIGNAL Clk,Rst: std_logic := '1';
BEGIN

PROCESS
BEGIN
Clk <= not CLK;
WAIT FOR 1 NS;
END PROCESS;

PROCESS
BEGIN
--Rst <= '1';
--WAIT FOR 2 NS;
Rst <= '0';
WAIT FOR 1 MS;
END PROCESS;

assemblage_processeur: ENTITY work.assemblage_processeur(behav) PORT MAP (Clk,Rst);

END ARCHITECTURE;