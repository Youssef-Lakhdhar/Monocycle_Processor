LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY unite_traitement_part_6 IS
PORT(
	RegWr,ALUSrc,WrEn,WrSrc,CLK,Rst,RegSel: IN std_logic;
	OP: IN std_logic_vector(1 DOWNTO 0);
	Rn,Rd,Rm: IN std_logic_vector(3 DOWNTO 0);
	Imm: IN std_logic_vector(7 DOWNTO 0);
	N,Z: OUT std_logic
	);
END ENTITY;

ARCHITECTURE behav OF unite_traitement_part_6 IS
	SIGNAL busA,busB,busW,DataOut,ALUout,Immout,MuxOut: std_logic_vector(31 DOWNTO 0);
	SIGNAL Rb: std_logic_vector(3 DOWNTO 0);
BEGIN

banc_registres: ENTITY work.banc_registres(behav) PORT MAP(Rd,Rn,Rb,RegWr,Clk,Rst,busW,busA,busB);
ALU: ENTITY work.ALU_part_6(behav2) PORT MAP(busA,MuxOut,OP,ALUout,N,Z);
muxALU: ENTITY work.Mux2_1(behav) GENERIC MAP(32) PORT MAP(busB,ImmOut,ALUSrc,MuxOut);
muxMem: ENTITY work.Mux2_1(behav) GENERIC MAP(32) PORT MAP(ALUout,DataOut,WrSrc,busW);
muxReg: ENTITY work.Mux2_1(behav) GENERIC MAP(4) PORT MAP(Rm,Rd,RegSel,Rb);
Memoire_D: ENTITY work.Memoire_D_part_6(behav) PORT MAP (Rst,Clk,WrEn,ALUout(5 DOWNTO 0),busB,DataOut);
extension: ENTITY work.Extension(behav) GENERIC MAP (8) PORT MAP (Imm,ImmOut);

END ARCHITECTURE;