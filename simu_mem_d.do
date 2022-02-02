vcom -93 -work work Memoire_D.vhd
vcom -93 -work work Memoire_D_tb.vhd

vsim Memoire_D_tb
view signals
view structure

add wave -position end  sim:/memoire_d_tb/Rst
add wave -position end  sim:/memoire_d_tb/Clk
add wave -position end  sim:/memoire_d_tb/WE
add wave -radix decimal  sim:/memoire_d_tb/DataIn
add wave -radix decimal  sim:/memoire_d_tb/DataOut
add wave -radix unsigned  sim:/memoire_d_tb/Addr
add wave -radix decimal  sim:/memoire_d_tb/Memoire_D/Memoire

run 500 ns