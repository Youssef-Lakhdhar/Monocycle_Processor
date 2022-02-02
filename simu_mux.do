vcom -93 -work work MUX2_1.vhd
vcom -93 -work work MUX2_1_tb.vhd

vsim MUX2_1_tb
view signals
view structure

add wave -radix decimal  sim:/mux2_1_tb/A
add wave -radix decimal  sim:/mux2_1_tb/B
add wave -radix decimal  sim:/mux2_1_tb/S
add wave -position end  sim:/mux2_1_tb/COM

run 40 ns

