library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity instruction_memory3 is 
	port(
		PC: in std_logic_vector (31 downto 0);
		Instruction: out std_logic_vector (31 downto 0)
    );
end entity;

architecture RTL of instruction_memory3 is
	type RAM64x32 is array (0 to 63) of std_logic_vector (31 downto 0);
	
function init_mem return RAM64x32 is 
	variable result : RAM64x32;
begin
	for i in 63 downto 0 loop
		result (i):=(others=>'0');
	end loop;					
		result (0):=x"E3A00020";-- MOV
		result (1):=x"E3A02001";-- MOV
		result (2):=x"E3A02000";-- MOV
		result (3):=x"E3A01001";-- MOV
		result (4):=x"E6103000";-- LDR
		result (5):=x"E6104001";-- LDR
		result (6):=x"E1530004";-- CMP
		result (7):=x"C6004000";-- STRGT
		result (8):=x"C6003001";-- STRGT
		result (9):=x"C2822001";-- ADDGT
		result (10):=x"E2800001";-- ADD
		result (11):=x"E2811001";-- ADD
		result (12):=x"E3510008";-- CMP
		result (13):=x"BAFFFFF6";-- BLT
		result (14):=x"E3520000";-- CMP
		result (15):=x"E3A00020";-- MOV
		result (16):=x"1AFFFFF1";-- BNE
		result (17):=x"EAFFFFFF";-- BAL
	return result;
end init_mem;	

signal mem: RAM64x32 := init_mem;

begin 
			Instruction <= mem(to_integer (unsigned (PC)));
end architecture;