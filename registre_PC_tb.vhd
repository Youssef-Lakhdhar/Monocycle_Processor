library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

ENTITY registre_PC_tb IS
END ENTITY;

ARCHITECTURE bench OF registre_PC_tb IS
	SIGNAL Clk,Rst,nPCsel: std_logic := '0';
	SIGNAL Offset: std_logic_vector(23 DOWNTO 0);
	SIGNAL Instruction: std_logic_vector(31 DOWNTO 0);
BEGIN

PROCESS
BEGIN
Clk <= not Clk;
WAIT FOR 1 NS;
END PROCESS;

PROCESS
BEGIN
Offset <= (OTHERS => '0');
WAIT FOR 20 NS;
Offset <= X"FFFFF9";
nPCsel <= '1';
WAIT FOR 4 NS;
nPCsel <= '0';
WAIT FOR 500 NS;
END PROCESS;

registre_PC: ENTITY work.registre_PC(behav) PORT MAP (Clk,Rst,nPCsel,Offset,Instruction);

END ARCHITECTURE;