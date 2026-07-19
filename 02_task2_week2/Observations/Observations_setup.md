# Week 2 Observations

## Repository Understanding
The reference repository demonstrates a complete mixed-signal RTL-to-GDS flow using an analog 2:1 AMUX macro integrated into a digital design using OpenLane.

## Files Required
The main files required are:
- Verilog
- LEF
- LIB
- OpenLane Configuration
- GDS
- Magic Layout

## Analog Macro
The AMUX2_3V macro is treated as a black-box analog IP and integrated into the digital implementation using LEF and Verilog.

## OpenLane
The OpenLane configuration defines:
- Design name
- Verilog files
- Black-box macro
- LEF file
- Clock
- Floorplan parameters

## Docker
Docker was successfully installed and verified using the hello-world container.

## Project Setup
The OpenLane project directory was created successfully and the required Verilog and LEF files were copied into the design folder.

## Current Status
- Repository study completed.
- Environment prepared.
- Project directory prepared.

Full OpenLane implementation is pending due to storage limitations in the virtual machine.
