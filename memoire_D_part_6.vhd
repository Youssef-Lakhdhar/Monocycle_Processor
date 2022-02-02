LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY Memoire_D_part_6 IS
PORT(
	Rst,Clk,WE: IN std_logic;
	Addr: IN std_logic_vector(5 DOWNTO 0);
	DataIn: IN std_logic_vector(31 DOWNTO 0);
	DataOut: OUT std_logic_vector(31 DOWNTO 0)
	);
END ENTITY;

ARCHITECTURE behav OF Memoire_D_part_6 IS
	TYPE tableau IS ARRAY(63 DOWNTO 0) OF std_logic_vector(31 DOWNTO 0);
	function init_memoire return tableau is
		variable result: tableau;
	begin
		
		result(32) := x"00000003";
		result(33) := x"0000006B";
		result(34) := x"0000001B";
		result(35) := x"0000000C";
		result(36) := x"00000142";
		result(37) := x"0000009B";
		result(38) := x"00000000";
		result(39) := x"0000003F";
		for i in 63 downto 40 loop
			result(i) := (OTHERS => '0');
		end loop;
		for i in 31 downto 0 loop
			result(i) := (OTHERS => '0');
		end loop;
		return result;
	end init_memoire;
	signal Memoire: tableau := init_memoire;
BEGIN
PROCESS(CLK,RST)
BEGIN
IF RST = '1' THEN
	Memoire <= init_memoire;
ELSIF rising_edge(Clk) THEN
	IF WE = '1' THEN
		Memoire(to_integer(unsigned(Addr))) <= DataIn;
	ELSE
		Memoire <= Memoire;
	END IF;
END IF;
END PROCESS;

DataOut <= Memoire(to_integer(unsigned(Addr)));

END ARCHITECTURE;