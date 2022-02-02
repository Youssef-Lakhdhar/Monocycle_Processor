LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.std_logic_signed.all;

ENTITY ALU_TB IS
END ENTITY;

ARCHITECTURE bench OF ALU_tb IS
	SIGNAL A,B,Y: std_logic_vector(31 DOWNTO 0);
	SIGNAL OP: std_logic_vector(1 DOWNTO 0);
	SIGNAL N: std_logic;
BEGIN
PROCESS
BEGIN

A <= std_logic_vector(to_signed(3,32));
B <= std_logic_vector(to_signed(12,32));
OP <= "00";
WAIT FOR 10 NS;

A <= std_logic_vector(to_signed(-3,32));
OP <= "01";
WAIT FOR 10 NS;

B <= std_logic_vector(to_signed(13,32));

OP <= "10";
WAIT FOR 10 NS;

B <= std_logic_vector(to_signed(-23,32));
OP <= "11";
WAIT FOR 10 NS;

OP <= "00";
WAIT FOR 10 NS;

A <= std_logic_vector(to_signed(3,32));

OP <= "10";
WAIT FOR 10 NS;

A <= std_logic_vector(to_signed(3,32));
B <= std_logic_vector(to_signed(-8,32));
OP <= "10";
WAIT FOR 10 NS;

OP <= "11";
WAIT FOR 10 NS;

OP <= "10";
WAIT FOR 10 NS;

A <= std_logic_vector(to_signed(-24,32));
B <= std_logic_vector(to_signed(3,32));
OP <= "00";
WAIT FOR 10 NS;
END PROCESS;

ALU: ENTITY work.ALU(behav) PORT MAP(A,B,OP,Y,N);

END ARCHITECTURE;