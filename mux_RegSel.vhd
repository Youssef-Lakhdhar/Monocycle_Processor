LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY mux_RegSel IS
PORT(
	RegSel: IN std_logic;
	DataA,DataB: IN std_logic_vector(3 DOWNTO 0);
	DataOut: OUT std_logic_vector(3 DOWNTO 0)
	);
END ENTITY;

ARCHITECTURE behav OF mux_RegSel IS 
BEGIN 
PROCESS(RegSel)
BEGIN
IF RegSel = '1' THEN
	DataOut <= DataA;
ELSE
	DataOut <= DataB;
END IF;
END PROCESS;

END ARCHITECTURE;