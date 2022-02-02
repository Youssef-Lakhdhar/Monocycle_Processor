vcom -93 -work work ALU.vhd
vcom -93 -work work banc_registres.vhd
vcom -93 -work work MUX2_1.vhd
vcom -93 -work work Extension.vhd
vcom -93 -work work Memoire_D.vhd
vcom -93 -work work unite_traitement_tb.vhd

vsim unite_traitement_tb
view signals
view structure

add wave -position end  sim:/unite_traitement_tb/CLK
add wave -position end  sim:/unite_traitement_tb/Rst
add wave -radix decimal  sim:/unite_traitement_tb/unite_traitement/banc_registres/Banc
add wave -radix decimal  sim:/unite_traitement_tb/unite_traitement/Memoire_D/Memoire
add wave -radix decimal  sim:/unite_traitement_tb/unite_traitement/Imm

run 500 ns