LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY ALU_part_6 IS
PORT ( 
	A,B: IN std_logic_vector (31 DOWNTO 0);
	OP: IN std_logic_vector(1 DOWNTO 0);
	Y: OUT std_logic_vector(31 DOWNTO 0);
	N,Z: OUT std_logic
	);
END ENTITY;

ARCHITECTURE BEHAV OF ALU_part_6 IS
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

PROCESS(Y_int)
BEGIN
IF Y_int = x"00000000" THEN
	Z <= '1';
ELSE
	Z <= '0';
END IF;
END PROCESS;

N <= Y_int(31);
Y <= std_logic_vector(Y_int);

END BEHAV;

ARCHITECTURE BEHAV2 OF ALU_part_6 IS
	SIGNAL Y_int: signed(31 DOWNTO 0);
BEGIN
muxop: WITH OP SELECT
	Y_int <=	signed(A) + signed(B) WHEN "00",
			signed(B) WHEN "01",
			signed(A) - signed(B) WHEN "10", 
			signed(A) WHEN "11",
			(OTHERS => '0') WHEN OTHERS;
	
muxZ: WITH Y_int SELECT
	Z <= 	'1' WHEN x"00000000",
		'0' WHEN OTHERS;

N <= Y_int(31);
Y <= std_logic_vector(Y_int);

END BEHAV2;