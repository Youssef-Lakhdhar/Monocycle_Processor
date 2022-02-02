LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY unite_traitement IS
PORT(
	RegWr,ALUSrc,WrEn,WrSrc,CLK,Rst: IN std_logic;
	OP: IN std_logic_vector(1 DOWNTO 0);
	Ra,Rb,Rw: IN std_logic_vector(3 DOWNTO 0);
	Imm: IN std_logic_vector(7 DOWNTO 0);
	N: OUT std_logic
	);
END ENTITY;

ARCHITECTURE behav OF unite_traitement IS
	SIGNAL busA,busB,busW,DataOut,ALUout,Immout,MuxOut: std_logic_vector(31 DOWNTO 0);
BEGIN

banc_registres: ENTITY work.banc_registres(behav) PORT MAP(Rw,Ra,Rb,RegWr,Clk,Rst,busW,busA,busB);
ALU: ENTITY work.ALU(behav) PORT MAP(busA,MuxOut,OP,ALUout,N);
muxALU: ENTITY work.Mux2_1(behav) GENERIC MAP(32) PORT MAP(busB,ImmOut,ALUSrc,MuxOut);
muxMem: ENTITY work.Mux2_1(behav) GENERIC MAP(32) PORT MAP(ALUout,DataOut,WrSrc,busW);
Memoire_D: ENTITY work.Memoire_D(behav) PORT MAP (Rst,Clk,WrEn,ALUout(5 DOWNTO 0),busB,DataOut);
extension: ENTITY work.Extension(behav) GENERIC MAP (8) PORT MAP (Imm,ImmOut);

END ARCHITECTURE;