LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY Mux2_1 IS
GENERIC(N: integer := 32);
PORT(
	A,B: IN std_logic_vector(N-1 DOWNTO 0);
	COM: IN std_logic;
	S: OUT std_logic_vector(N-1 DOWNTO 0)
	);
END ENTITY;

ARCHITECTURE behav OF Mux2_1 IS
BEGIN
PROCESS(COM,A,B)
BEGIN
IF COM = '0' THEN
	S <= A;
ELSE
	S <= B;
END IF;
END PROCESS;
END ARCHITECTURE;

	