LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY Extension IS
GENERIC(N: integer := 32);
PORT(
	E: IN std_logic_vector(N-1 DOWNTO 0);
	S: OUT std_logic_vector(31 DOWNTO 0)
	);
END ENTITY;

ARCHITECTURE behav OF Extension IS
	SIGNAL comp: std_logic_vector(31 - N DOWNTO 0);
BEGIN
comp <= (OTHERS => E(N-1));
S <= comp&E;

END ARCHITECTURE;

