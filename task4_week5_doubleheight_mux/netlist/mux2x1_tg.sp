*=========================================================
* 2:1 Transmission Gate Analog Multiplexer
* SKY130A
*=========================================================

.lib "/home/lokashsri/.ciel/ciel/sky130/versions/0fe599b2afb6708d281543108caf8310912f54af/sky130A/libs.tech/ngspice/sky130.lib.spice" tt

.global VDD VSS

VDD VDD 0 DC 1.8
VSS VSS 0 DC 0

* Input signals
VIN0 IN0 0 DC 0.3
VIN1 IN1 0 DC 1.2

* Select signal
VSEL SEL 0 PULSE(0 1.8 0 100p 100p 5n 10n)

*---------------------------------------------------------
* Inverter to generate SEL_BAR
*---------------------------------------------------------

X1 SEL_BAR SEL VDD VDD sky130_fd_pr__pfet_01v8 L=0.15u W=0.42u
X2 SEL_BAR SEL VSS VSS sky130_fd_pr__nfet_01v8 L=0.15u W=0.42u

*---------------------------------------------------------
* Transmission Gate for IN0
*---------------------------------------------------------

X3 OUT SEL_BAR IN0 VDD sky130_fd_pr__pfet_01v8 L=0.15u W=0.42u
X4 OUT SEL     IN0 VSS sky130_fd_pr__nfet_01v8 L=0.15u W=0.42u

*---------------------------------------------------------
* Transmission Gate for IN1
*---------------------------------------------------------

X5 OUT SEL     IN1 VDD sky130_fd_pr__pfet_01v8 L=0.15u W=0.42u
X6 OUT SEL_BAR IN1 VSS sky130_fd_pr__nfet_01v8 L=0.15u W=0.42u

* Output load
CLOAD OUT 0 20f

.tran 100p 40n

.control
run
plot v(IN0) v(IN1) v(SEL) v(SEL_BAR) v(OUT)
.endc

.endl tt
.end
