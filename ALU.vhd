LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY ALU IS
PORT ( 
	A,B: IN std_logic_vector (31 DOWNTO 0);
	OP: IN std_logic_vector(1 DOWNTO 0);
	Y: OUT std_logic_vector(31 DOWNTO 0);
	N: OUT std_logic
	);
END ENTITY;

ARCHITECTURE BEHAV OF ALU IS
	SIGNAL Y_int: signed(31 DOWNTO 0);
BEGIN
PROCESS(OP,A,B)
BEGIN 
IF OP = "00" THEN
	Y_int <= signed(A) + signed(B);
ELSIF OP = "01" THEN
	Y_int <= signed(B);
ELSIF OP = "10" THEN
	Y_int <= signed(A) - signed(B);
ELSIF OP = "11" THEN 
	Y_int <= signed(A);
ELSE
	Y_int <= (OTHERS => '0');	
END IF;
END PROCESS;

N <= Y_int(31);
Y <= std_logic_vector(Y_int);

END ARCHITECTURE;


