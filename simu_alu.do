vcom -93 -work work ALU.vhd
vcom -93 -work work alu_tb.vhd

vsim alu_tb
view signals
view structure

add wave -radix decimal sim:/alu_tb/A
add wave -radix decimal sim:/alu_tb/B
add wave -radix decimal sim:/alu_tb/Y
add wave -position end  sim:/alu_tb/OP
add wave -position end  sim:/alu_tb/N

run 100 ns