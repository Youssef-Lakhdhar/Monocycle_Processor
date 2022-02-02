vcom -93 -work work Extension.vhd
vcom -93 -work work Extension_tb.vhd

vsim Extension_tb
view signals
view structure

add wave -position end  sim:/extension_tb/N
add wave -radix decimal sim:/extension_tb/E
add wave -radix decimal sim:/extension_tb/S

run 50 ns