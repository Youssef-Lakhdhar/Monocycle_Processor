vcom -93 -work work *.vhd

vsim assemblage_processeur_tb
view signals
view structure

add wave -position end  sim:/assemblage_processeur_tb/Clk
add wave -position end  sim:/assemblage_processeur_tb/Rst
add wave -position end  sim:/assemblage_processeur_tb/assemblage_processeur/decodeur_instruction/instr_courante
add wave -radix hexadecimal  sim:/assemblage_processeur_tb/assemblage_processeur/decodeur_instruction/Instruction
add wave -radix decimal  sim:/assemblage_processeur_tb/assemblage_processeur/unite_traitement/banc_registres/Banc(2)
add wave -radix decimal  sim:/assemblage_processeur_tb/assemblage_processeur/unite_traitement/banc_registres/Banc(1)
add wave -radix decimal  sim:/assemblage_processeur_tb/assemblage_processeur/unite_traitement/banc_registres/Banc(0)
add wave -radix decimal  sim:/assemblage_processeur_tb/assemblage_processeur/unite_traitement/Memoire_D/Memoire(26)
add wave -radix decimal  sim:/assemblage_processeur_tb/assemblage_processeur/unite_traitement/Memoire_D/Memoire(25)
add wave -radix decimal  sim:/assemblage_processeur_tb/assemblage_processeur/unite_traitement/Memoire_D/Memoire(24)
add wave -radix decimal  sim:/assemblage_processeur_tb/assemblage_processeur/unite_traitement/Memoire_D/Memoire(23)
add wave -radix decimal  sim:/assemblage_processeur_tb/assemblage_processeur/unite_traitement/Memoire_D/Memoire(22)
add wave -radix decimal  sim:/assemblage_processeur_tb/assemblage_processeur/unite_traitement/Memoire_D/Memoire(21)
add wave -radix decimal  sim:/assemblage_processeur_tb/assemblage_processeur/unite_traitement/Memoire_D/Memoire(20)
add wave -radix decimal  sim:/assemblage_processeur_tb/assemblage_processeur/unite_traitement/Memoire_D/Memoire(19)
add wave -radix decimal  sim:/assemblage_processeur_tb/assemblage_processeur/unite_traitement/Memoire_D/Memoire(18)
add wave -radix decimal  sim:/assemblage_processeur_tb/assemblage_processeur/unite_traitement/Memoire_D/Memoire(17)
add wave -radix decimal  sim:/assemblage_processeur_tb/assemblage_processeur/unite_traitement/Memoire_D/Memoire(16)

run 200 ns