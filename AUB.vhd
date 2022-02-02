LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY AUB IS
END ENTITY;

ARCHITECTURE assemblage OF AUB IS
	SIGNAL Rw,Ra,Rb: std_logic_vector(3 DOWNTO 0);
	SIGNAL busA,busB,busW: std_logic_vector(31 DOWNTO 0);
	SIGNAL WE,Rst,Clk,N: std_logic := '0';
	SIGNAL OP: std_logic_vector(1 DOWNTO 0);
BEGIN

PROCESS
BEGIN
Clk <= not CLK;
WAIT FOR 1 NS;
END PROCESS;

PROCESS
BEGIN

--On commence par copier R(15) dans R(1)
Rb <= "1111";
OP <= "01"; -- Y <= B
WE <= '1'; -- On autorise l'ecriture
Rw <= "0001"; -- On ecrit sur R(1)
WAIT FOR 5 NS; -- On a normalement R(1) = R(15)  avec R(1) = 48 et R(15) = 48
Ra <= "0001"; -- On copie R(1)
OP <= "00"; -- Y <= A + B
WAIT FOR 5 NS; -- On a normalement R(1) = R(1) + R(15) avec R(1) = 96 et R(15) = 48
Rw <= "0010"; -- On va maintenant ecrire sur R(2)
WAIT FOR 5 NS; -- On a normalement R(2) = R(1) + R(15) avec R(2) = 144 R(1) = 96 et R(15) = 48
OP <= "10"; -- Y <= A - B
Rw <= "0011"; -- On ecrit sur R(3)
WAIT FOR 5 NS; -- On a normalement R(3) = R(1) - R(15) avec R(3) = 48 R(1) = 96 et R(15) = 48
Ra <= "0111"; -- On copie R(7)
Rw <= "0101"; -- On ecrit sur R(5)
WAIT FOR 5 NS; -- On a normalement R(5) = R(7) - R(15) avec R(5) = -48 R(7) = 0 et R(15) = 48

END PROCESS;

UAL: ENTITY work.ALU(behav) PORT MAP(busA,busB,OP,busW,N);
Registers: ENTITY work.banc_registres(behav) PORT MAP(Rw,Ra,Rb,WE,Clk,Rst,busW,busA,busB);

END ARCHITECTURE;
