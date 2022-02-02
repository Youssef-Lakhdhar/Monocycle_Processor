LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY banc_registres IS
PORT(
	Rw,Ra,Rb: IN std_logic_vector(3 DOWNTO 0);
	WE,Clk,RST: IN std_logic;
	W: IN std_logic_vector(31 DOWNTO 0);
	A,B: OUT std_logic_vector(31 DOWNTO 0)
	);
END ENTITY;

ARCHITECTURE behav OF banc_registres IS
	TYPE table IS ARRAY(15 DOWNTO 0) OF std_logic_vector(31 DOWNTO 0);
	function init_banc return table is
		variable result: table;
	begin
		--for i in 14 downto 0 loop
			--result(i) := (others=>'0');
		for i in 13 downto 0 loop
			result(i) := std_logic_vector(to_signed(i,32));
		end loop;
		result(14) := X"FFFFFFFD";
		result(15) := X"00000030";
		return result;
	end init_banc;
	signal Banc: table := init_banc;
BEGIN
PROCESS(CLK,RST)
BEGIN
IF RST = '1' THEN
	Banc <= init_banc;
ELSE
	IF rising_edge(CLK) THEN 
		IF WE = '1' THEN
			Banc(to_integer(unsigned(Rw))) <= W;
		ELSE
			Banc <= Banc;
		END IF;
	END IF;
END IF;
END PROCESS;

A <= Banc(to_integer(unsigned(Ra)));
B <= Banc(to_integer(unsigned(Rb)));

END ARCHITECTURE;

	