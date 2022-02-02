LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY Memoire_D IS
PORT(
	Rst,Clk,WE: IN std_logic;
	Addr: IN std_logic_vector(5 DOWNTO 0);
	DataIn: IN std_logic_vector(31 DOWNTO 0);
	DataOut: OUT std_logic_vector(31 DOWNTO 0)
	);
END ENTITY;

ARCHITECTURE behav OF Memoire_D IS
	TYPE tableau IS ARRAY(63 DOWNTO 0) OF std_logic_vector(31 DOWNTO 0);
	function init_memoire return tableau is
		variable result: tableau;
	begin
		--for i in 63 downto 0 loop
			--result(i) := (others=>'0');
		--end loop;
		for i in 26 downto 0 loop
			result(i) := std_logic_vector(to_signed(2*i,32));
		end loop;
		for i in 63 downto 27 loop
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