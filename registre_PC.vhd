library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

ENTITY registre_PC IS
PORT(
	Clk,Rst,nPCsel: IN std_logic;
	Offset: IN std_logic_vector(23 DOWNTO 0);
	Instruction: OUT std_logic_vector(31 DOWNTO 0)
	);
END ENTITY;

ARCHITECTURE behav OF registre_PC IS
	SIGNAL Addr: std_logic_vector(31 DOWNTO 0) := (OTHERS => '0');
	SIGNAL Off_Ext: std_logic_vector(31 DOWNTO 0) := (OTHERS => '0');
BEGIN
PROCESS(Clk,Rst)
BEGIN
IF rising_edge(Clk) THEN
	IF nPCsel = '0' THEN
		Addr <= std_logic_vector(signed(Addr) + to_signed(1,32));
	ELSIF nPCsel = '1' THEN
		Addr <= std_logic_vector(signed(Addr) + to_signed(1,32) + signed(Off_Ext));
	ELSE
		Addr <= Addr;
	END IF;
END IF;
END PROCESS;

extension: ENTITY work.Extension(behav) GENERIC MAP (24) PORT MAP (Offset,Off_Ext);
--instruction_memory: ENTITY work.instruction_memory(RTL) PORT MAP (Addr,Instruction);
--instruction_memory2: ENTITY work.instruction_memory2(RTL) PORT MAP (Addr,Instruction);
instruction_memory3: ENTITY work.instruction_memory3(RTL) PORT MAP (Addr,Instruction);

END ARCHITECTURE;