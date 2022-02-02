LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY Extension_tb IS
END ENTITY;

ARCHITECTURE bench OF Extension_tb IS
	SIGNAL N: integer := 12;
	SIGNAL E: std_logic_vector(N-1 DOWNTO 0);
	SIGNAL S: std_logic_vector(31 DOWNTO 0);
BEGIN
PROCESS
BEGIN

E <= X"010"; -- 16
WAIT FOR 10 NS;
E <= X"0F0"; -- 240
WAIT FOR 10 NS;
E <= X"028"; -- 40
WAIT FOR 10 NS;
E <= X"FD8"; -- -40
WAIT FOR 10 NS;
E <= X"000"; -- 0
WAIT FOR 10 NS;
END PROCESS;

extension: ENTITY work.Extension(behav) GENERIC MAP (12) PORT MAP (E,S);

END ARCHITECTURE;