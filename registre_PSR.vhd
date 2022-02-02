LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY registre_PSR IS
PORT(
	Rst,Clk,WE: IN std_logic;
	DataIn: IN std_logic_vector(31 DOWNTO 0);
	DataOut: OUT std_logic_vector(31 DOWNTO 0)
	);
END ENTITY;

ARCHITECTURE behav OF registre_PSR IS
	SIGNAL Data_Int: std_logic_vector(31 DOWNTO 0);
BEGIN
PROCESS(Clk,Rst)
BEGIN
IF Rst = '1' THEN
	DataOut <= (OTHERS => '0');
ELSIF rising_edge(Clk) THEN
	IF WE = '1' THEN
		DataOut <= "0000000000000000000000000000000" & DataIn(0); 
	END IF;
END IF;
END PROCESS;

END ARCHITECTURE;
	