vcom -93 -work work *.vhd

vsim assemblage_part_6_tb
view signals
view structure

#Ne pas oublier de changer l'instruction memory dans le registre PC

add wave -position end  sim:/assemblage_part_6_tb/Clk
add wave -position end  sim:/assemblage_part_6_tb/Rst
add wave -position end  sim:/assemblage_part_6_tb/assemblage_processeur/decodeur_instruction/instr_courante
add wave -radix hexadecimal  sim:/assemblage_part_6_tb/assemblage_processeur/decodeur_instruction/Instruction
add wave -radix decimal  sim:/assemblage_part_6_tb/assemblage_processeur/unite_traitement/banc_registres/Banc(4)
add wave -radix decimal sim:/assemblage_part_6_tb/assemblage_processeur/unite_traitement/banc_registres/Banc(3)
add wave -radix decimal  sim:/assemblage_part_6_tb/assemblage_processeur/unite_traitement/banc_registres/Banc(2)
add wave -radix decimal  sim:/assemblage_part_6_tb/assemblage_processeur/unite_traitement/banc_registres/Banc(1)
add wave -radix decimal  sim:/assemblage_part_6_tb/assemblage_processeur/unite_traitement/banc_registres/Banc(0)
add wave -radix decimal  sim:/assemblage_part_6_tb/assemblage_processeur/unite_traitement/Memoire_D/Memoire(39)
add wave -radix decimal  sim:/assemblage_part_6_tb/assemblage_processeur/unite_traitement/Memoire_D/Memoire(38)
add wave -radix decimal  sim:/assemblage_part_6_tb/assemblage_processeur/unite_traitement/Memoire_D/Memoire(37)
add wave -radix decimal  sim:/assemblage_part_6_tb/assemblage_processeur/unite_traitement/Memoire_D/Memoire(36)
add wave -radix decimal  sim:/assemblage_part_6_tb/assemblage_processeur/unite_traitement/Memoire_D/Memoire(35)
add wave -radix decimal  sim:/assemblage_part_6_tb/assemblage_processeur/unite_traitement/Memoire_D/Memoire(34)
add wave -radix decimal  sim:/assemblage_part_6_tb/assemblage_processeur/unite_traitement/Memoire_D/Memoire(33)
add wave -radix decimal  sim:/assemblage_part_6_tb/assemblage_processeur/unite_traitement/Memoire_D/Memoire(32)


run 1.5 us