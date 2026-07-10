###############################################################################
# Created by write_sdc
# Thu Jul  9 13:33:45 2026
###############################################################################
current_design design_mux
###############################################################################
# Timing Constraints
###############################################################################
create_clock -name select -period 10.0000 [get_ports {select}]
set_clock_transition 0.1500 [get_clocks {select}]
set_clock_uncertainty 0.2500 select
set_propagated_clock [get_clocks {select}]
set_input_delay 2.0000 -clock [get_clocks {select}] -add_delay [get_ports {CSB}]
set_input_delay 2.0000 -clock [get_clocks {select}] -add_delay [get_ports {RST}]
set_input_delay 2.0000 -clock [get_clocks {select}] -add_delay [get_ports {SCK}]
set_input_delay 2.0000 -clock [get_clocks {select}] -add_delay [get_ports {SDI}]
set_input_delay 2.0000 -clock [get_clocks {select}] -add_delay [get_ports {mask_rev_in[0]}]
set_input_delay 2.0000 -clock [get_clocks {select}] -add_delay [get_ports {mask_rev_in[1]}]
set_input_delay 2.0000 -clock [get_clocks {select}] -add_delay [get_ports {mask_rev_in[2]}]
set_input_delay 2.0000 -clock [get_clocks {select}] -add_delay [get_ports {mask_rev_in[3]}]
set_input_delay 2.0000 -clock [get_clocks {select}] -add_delay [get_ports {trap}]
set_output_delay 2.0000 -clock [get_clocks {select}] -add_delay [get_ports {out}]
###############################################################################
# Environment
###############################################################################
set_load -pin_load 0.0334 [get_ports {out}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {CSB}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {RST}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {SCK}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {SDI}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {select}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {trap}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {mask_rev_in[3]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {mask_rev_in[2]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {mask_rev_in[1]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {mask_rev_in[0]}]
set_timing_derate -early 0.9500
set_timing_derate -late 1.0500
###############################################################################
# Design Rules
###############################################################################
set_max_transition 0.7500 [current_design]
set_max_fanout 10.0000 [current_design]
