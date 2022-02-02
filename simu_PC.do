vcom -93 -work work registre_PC.vhd
vcom -93 -work work registre_PC_tb.vhd

vsim registre_PC_tb
view signals
view structure

add wave -position end  sim:/registre_pc_tb/registre_PC/Clk
add wave -position end  sim:/registre_pc_tb/registre_PC/Rst
add wave -position end  sim:/registre_pc_tb/registre_PC/nPCsel
add wave -radix decimal  sim:/registre_pc_tb/registre_PC/Offset
add wave -radix hexadecimal  sim:/registre_pc_tb/registre_PC/Instruction
add wave -radix decimal  sim:/registre_pc_tb/registre_PC/Addr

run 500 ns