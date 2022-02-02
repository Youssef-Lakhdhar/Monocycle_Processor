LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY assemblage_processeur IS
PORT(
	Clk,Rst: IN std_logic
	);
END ENTITY;

ARCHITECTURE behav OF assemblage_processeur IS
	SIGNAL nPCsel,PSREn,RegWr,RegSel,ALUSrc,WrSrc,MemWr,N: std_logic;
	SIGNAL ALUCtr: std_logic_vector(1 DOWNTO 0);
	SIGNAL Rm,Rd,Rn,Rb: std_logic_vector(3 DOWNTO 0);
	SIGNAL N_32,PSRout,Instruction: std_logic_vector(31 DOWNTO 0) := (OTHERS => '0');
	SIGNAL Offset: std_logic_vector(23 DOWNTO 0);
	Signal Imm: std_logic_vector(7 DOWNTO 0);
BEGIN
	
N_32(0) <= N;
decodeur_instruction: ENTITY work.decodeur_instruction(behav) PORT MAP (Instruction,N,Rn,Rd,Rm,nPCsel,PSREn,RegWr,RegSel,ALUSrc,WrSrc,MemWr,ALUCtr,Imm,Offset);
gestion_instructions: ENTITY work.registre_PC(behav) PORT MAP (Clk,Rst,nPCsel,Offset,Instruction);
unite_traitement: ENTITY work.unite_traitement_Reg(behav) PORT MAP (RegWr,ALUSrc,MemWr,WrSrc,CLK,Rst,RegSel,ALUCtr,Rn,Rd,Rm,Imm,N);
unite_controle: ENTITY work.registre_PSR(behav) PORT MAP (Rst,Clk,PSREn,N_32,PSRout);

END ARCHITECTURE;