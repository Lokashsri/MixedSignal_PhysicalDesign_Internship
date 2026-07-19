# Commands Used

## Simulation

iverilog AMUX2_3V.v AMUX2_3V_tb.v -o amux_sim

vvp amux_sim

gtkwave amux.vcd


## OpenLane Flow

make pdk

make mount

flow.tcl -design design_mux


