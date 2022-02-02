vcom -93 -work work banc_registres.vhd
vcom -93 -work work banc_registres_tb.vhd

vsim banc_registres_tb
view signals
view structure

add wave -position end  sim:/banc_registres_tb/Rst
add wave -position end  sim:/banc_registres_tb/CLK
add wave -position end  sim:/banc_registres_tb/WE
add wave -position end  sim:/banc_registres_tb/Ra
add wave -position end  sim:/banc_registres_tb/Rb
add wave -position end sim:/banc_registres_tb/Rw
add wave -radix decimal  sim:/banc_registres_tb/A
add wave -radix decimal  sim:/banc_registres_tb/B
add wave -radix decimal sim:/banc_registres_tb/W
add wave -radix decimal  sim:/banc_registres_tb/banc_registres/Banc

run 500 ns