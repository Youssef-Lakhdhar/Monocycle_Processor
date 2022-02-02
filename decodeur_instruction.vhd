LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY decodeur_instruction IS
PORT(
	Instruction: IN std_logic_vector(31 DOWNTO 0);
	N: IN std_logic;
	Rn,Rd,Rm: OUT std_logic_vector(3 DOWNTO 0);
	nPCsel,PSREn,RegWr,RegSel,ALUSrc,WrSrc,MemWr: OUT std_logic;
	ALUCtr: OUT std_logic_vector(1 DOWNTO 0);
	Imm: OUT std_logic_vector(7 DOWNTO 0);
	Offset: OUT std_logic_vector(23 DOWNTO 0)
	);
END ENTITY;

ARCHITECTURE behav OF decodeur_instruction IS
	type enum_instruction is (MOV,ADDi,ADDr,CMP,LDR,STR,BAL,BLT);
	SIGNAL instr_courante: enum_instruction;
BEGIN
PROCESS(Instruction)
BEGIN
IF Instruction(31 DOWNTO 20) = x"E28" THEN
	instr_courante <= ADDi;
ELSIF Instruction(31 DOWNTO 20) = x"E08" THEN
	instr_courante <= ADDr;
ELSIF Instruction(31 DOWNTO 20) = x"E3A" THEN
	instr_courante <= MOV;
ELSIF Instruction(31 DOWNTO 20) = x"E35" THEN
	instr_courante <= CMP;
ELSIF Instruction(27 DOWNTO 20) = x"61" THEN
	instr_courante <= LDR;
ELSIF Instruction(27 DOWNTO 20) = x"60" THEN
	instr_courante <= STR;
ELSIF Instruction(31 DOWNTO 24) = x"EA" THEN
	instr_courante <= BAL;
ELSIF Instruction(31 DOWNTO 24) = x"BA" THEN
	instr_courante <= BLT;
END IF;
END PROCESS;

PROCESS(instr_courante,Instruction)
BEGIN
CASE instr_courante IS
	when MOV =>	nPCsel <= '0';
		    	RegWr <= '1';
			ALUSrc <= '1';
			ALUCtr <= "01";
			PSREn <= '0';
			MemWr <= '0';
			WrSrc <= '0';
			RegSel <= '1'; 
			Rd <= Instruction(15 DOWNTO 12);
			Imm <= Instruction(7 DOWNTO 0); 
			
	when ADDi =>	nPCsel <= '0';
		    	RegWr <= '1';
			ALUSrc <= '1';
			ALUCtr <= "00";
			PSREn <= '0';
			MemWr <= '0';
			WrSrc <= '0';
			RegSel <= '1'; 
			Rn <= Instruction(19 DOWNTO 16);
			Rd <= Instruction(15 DOWNTO 12);
			Imm <= Instruction(7 DOWNTO 0);
			

	when ADDr => 	nPCsel <= '0';
		    	RegWr <= '1';
			ALUSrc <= '0';
			ALUCtr <= "00";
			PSREn <= '0';
			MemWr <= '0';
			WrSrc <= '0';
			RegSel <= '0'; 
			Rn <= Instruction(19 DOWNTO 16);
			Rd <= Instruction(15 DOWNTO 12);
			Rm <= Instruction(3 DOWNTO 0);

	when CMP =>	nPCsel <= '0';
		    	RegWr <= '0';
			ALUSrc <= '1';
			ALUCtr <= "10";
			PSREn <= '1';
			MemWr <= '0';
			WrSrc <= '0';
			RegSel <= '1';
			Rn <= Instruction(19 DOWNTO 16);
			Imm <= Instruction(7 DOWNTO 0);
 
	when LDR =>	nPCsel <= '0';
		    	RegWr <= '1';
			ALUSrc <= '1';
			ALUCtr <= "00";
			PSREn <= '0';
			MemWr <= '0';
			WrSrc <= '1';
			RegSel <= '1'; 
			Rn <= Instruction(19 DOWNTO 16);
			Rd <= Instruction(15 DOWNTO 12);
			Offset <= x"000" & Instruction(11 DOWNTO 0);
			Imm <= std_logic_vector(to_unsigned(to_integer(signed(Instruction(11 DOWNTO 0))),8));

	when STR =>	nPCsel <= '0';
		    	RegWr <= '0';
			ALUSrc <= '1';
			ALUCtr <= "00";
			PSREn <= '0';
			MemWr <= '1';
			WrSrc <= '0';
			RegSel <= '1';
			Rn <= Instruction(19 DOWNTO 16);
			Rd <= Instruction(15 DOWNTO 12);
			Offset <= x"000" & Instruction(11 DOWNTO 0);
			Imm <= std_logic_vector(to_unsigned(to_integer(signed(Instruction(11 DOWNTO 0))),8));

	when BAL =>	nPCsel <= '1';
		    	RegWr <= '0';
			ALUSrc <= '0';
			ALUCtr <= "00";
			PSREn <= '0';
			MemWr <= '0';
			WrSrc <= '0';
			RegSel <= '1'; 
			Offset <= Instruction(23 DOWNTO 0);

	when BLT =>	nPCsel <= '1';
		    	RegWr <= '0';
			ALUSrc <= '0';
			ALUCtr <= "10";
			PSREn <= '0';
			MemWr <= '0';
			WrSrc <= '0';
			RegSel <= '1'; 
			Imm <= (OTHERS => '0');
			IF N = '1' THEN
				Offset <= Instruction(23 DOWNTO 0);
			ELSE
				Offset <= (OTHERS => '0');
			END IF;

	when others =>  nPCsel <= '0';
		    	RegWr <= '0';
			ALUSrc <= '0';
			ALUCtr <= "00";
			PSREn <= '0';
			MemWr <= '0';
			WrSrc <= '0';
			RegSel <= '0';
			Offset <= (OTHERS => '0');
			Imm <= (OTHERS => '0'); 		

END CASE;
END PROCESS;

END ARCHITECTURE;