##############################################
# Part         - xcvu9p
# Package      - fsgd2104
# Speed grade  - -2L
# Xilinx Reference Board is VCU1525
###############################################################################

# General configuration - Do not modify
set_property CFGBVS GND                                [current_design]
set_property CONFIG_VOLTAGE 1.8                        [current_design]
set_property BITSTREAM.GENERAL.COMPRESS true           [current_design]
set_property BITSTREAM.CONFIG.EXTMASTERCCLK_EN {DIV-1} [current_design]
set_property BITSTREAM.CONFIG.SPI_32BIT_ADDR YES       [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4           [current_design]
set_property BITSTREAM.CONFIG.SPI_FALL_EDGE YES        [current_design]

#############################################################################################################

// all are IOSTANDARD

//clk_p AY37 DIFF_SSTL12
set_property PACKAGE_PIN AY37 [get_ports {clk_p}]
set_property IOSTANDARD DIFF_SSTL12 [get_ports {clk_p}]

//clk_n AY38 DIFF_SSTL12
set_property PACKAGE_PIN AY38 [get_ports {clk_n}]
set_property IOSTANDARD DIFF_SSTL12 [get_ports {clk_n}]

//clk -- -- 100MHz  Generated signal
create_clock -name clk -period 10 [get_ports {clk_p}]

// rst_n BD21 LVCMOS18 Requires Pullup
set_property PACKAGE_PIN BD21 [get_ports {rst_n}]
set_property IOSTANDARD LVCMOS18 [get_ports {rst_n}]
set_property PULLUP true [get_ports {rst_n}]


//led_0 BC21 LVCMOS18
set_property PACKAGE_PIN BC21 [get_ports {led_0}]
set_property IOSTANDARD LVCMOS18 [get_ports {led_0}]

//led_1 BB21 LVCMOS18
set_property PACKAGE_PIN BB21 [get_ports {led_1}]
set_property IOSTANDARD LVCMOS18 [get_ports {led_1}]

//led_2 BA20 LVCMOS18
set_property PACKAGE_PIN BA20 [get_ports {led_2}]
set_property IOSTANDARD LVCMOS18 [get_ports {led_2}]

//button AL20 LVCMOS18
set_property PACKAGE_PIN AL20 [get_ports {button}]
set_property IOSTANDARD LVCMOS18 [get_ports {button}]
