LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY unite_traitement_tb IS
END ENTITY;

ARCHITECTURE bench OF unite_traitement_tb IS
	SIGNAL RegWr,ALUSrc,WrEn,WrSrc,CLK,Rst,N: std_logic := '0';
	SIGNAL OP: std_logic_vector(1 DOWNTO 0);
	SIGNAL Ra,Rb,Rw: std_logic_vector(3 DOWNTO 0);
	SIGNAL Imm: std_logic_vector(7 DOWNTO 0);
BEGIN

PROCESS
BEGIN
Clk <= not Clk;
WAIT FOR 1 NS;
END PROCESS;

PROCESS
BEGIN
WAIT FOR 9 NS;

Rst <= '0';
Ra <= X"1"; --R(1)
Rb <= X"E"; --R(14)
ALUSrc <= '0';
OP <= "00";
WrEn <= '0';
WrSrc <= '0';
Rw <= X"7";
RegWr <= '1';
Imm <= X"0F";
WAIT FOR 10 NS; -- R(7) = R(1) + R(14)
Rst <= '0';
Ra <= X"7";
Rb <= X"E";
ALUSrc <= '0';
OP <= "00";
WrEn <= '0';
WrSrc <= '0';
Rw <= X"7";
RegWr <= '1';
WAIT FOR 10 NS; -- R(7) = R(7) + R(14)
Ra <= X"7";
ALUSrc <= '1';
Rw <= X"5";
WAIT FOR 10 NS; -- R(5) = R(7) + Imm et Imm = 16
Rst <= '1';
ALUSrc <= '0';
RegWr <= '0';
WAIT FOR 10 NS; -- RESET
Rst <= '0';
Ra <= X"4";
Rb <= X"9";
ALUSrc <= '0';
OP <= "10";
WrSrc <= '0';
RegWr <= '1';
Rw <= X"A"; 
WAIT FOR 10 NS; -- R(10) = R(4) - R(9)
ALUSrc <= '1';
Rw <= X"5";
WAIT FOR 10 NS; -- R(5) = R(4) - Imm et Imm = 15
Ra <= X"2";
OP <= "11";
WrSrc <= '0';
Rw <= X"8"; 
WAIT FOR 10 NS; -- R(8) = R(2)
Ra <= X"0"; -- Addr
Rb <= X"F";
OP <= "11";
WrEn <= '1';
RegWr <= '0';
WAIT FOR 10 NS; -- R(15) dans Memoire(0)
WrEn <= '0';
RegWr <= '1';
WrSrc <= '1';
Rw <= X"D";
WAIT FOR 10 NS; -- Memoire(0) dans R(13)
END PROCESS; 

unite_traitement: ENTITY work.unite_traitement(behav) PORT MAP (RegWr,ALUSrc,WrEn,WrSrc,CLK,Rst,OP,Ra,Rb,Rw,Imm,N);

END ARCHITECTURE;
