# Mixed-Signal Physical Design Internship

## AI-Assisted Mixed-Signal Circuit Design and RTL-to-GDSII Physical Design Flow

This repository contains the complete work completed during the **VSD Mixed-Signal Physical Design Internship**.

The internship focused on understanding and implementing a complete mixed-signal physical design workflow using open-source EDA tools, SKY130 PDK, OpenLane, OpenROAD, Verilog simulation, and AI-assisted design methodology.

The project covers:

- Mixed-signal physical design fundamentals
- SKY130 PDK study
- OpenLane and OpenROAD flow
- RTL-to-GDSII implementation
- Analog IP integration concepts
- 2:1 Analog Multiplexer (AMUX2_3V) design
- Verilog simulation and waveform verification
- AI-assisted circuit design workflow
- Documentation and reproducibility


---

# Repository Structure

```
MixedSignal_PhysicalDesign_Internship/

│
├── task1_week1/
│   ├── Notes/
│   ├── Report/
│   └── README.md
│
├── task2_week2/
│   ├── Commands/
│   ├── Environment/
│   ├── Observations/
│   ├── Prompts/
│   ├── Screenshots/
│   └── README.md
│
├── task2_week3/
│   ├── Commands/
│   ├── Comparison/
│   ├── Observations/
│   ├── Prompts/
│   ├── Screenshots/
│   ├── generated_files/
│   ├── reports/
│   ├── simulation/
│   └── README.md
│
├── task4_ai_assisted_demonstration/
│   ├── Commands/
│   ├── Prompts/
│   ├── Screenshots/
│   ├── Video/
│   ├── AMUX2_3V.v
│   ├── AMUX2_3V_tb.v
│   ├── amux.vcd
│   └── README.md
│
├── LICENSE
└── README.md
```

---

# Task 1 - Week 1

# Study of Mixed-Signal Physical Design Flow

The first phase focused on understanding the fundamentals of mixed-signal physical design and studying the reference RTL-to-GDSII flow.

## Topics Studied

- Mixed-signal IC design concepts
- Analog and digital IP integration
- RTL-to-GDSII physical design methodology
- SKY130 open-source PDK
- OpenLane architecture
- OpenROAD tools
- Physical design stages


## Reference Repository

The reference flow was studied from:

```
https://github.com/praharshapm/vsdmixedsignalflow
```


The study included:

- RTL inputs
- LEF files
- LIB files
- Technology files
- Analog macro integration
- Floorplanning
- Placement
- CTS
- Routing
- Layout generation
- Verification


---

# Task 2 - Week 2

# Environment Setup and OpenLane Preparation

The second phase focused on preparing the complete physical design environment.


## Environment

Host:

- Windows 11


Virtual Machine:

- Ubuntu Linux using VirtualBox


## Tools Installed

- Git
- Python
- GCC
- CMake
- Docker
- OpenLane
- OpenROAD
- SKY130 PDK


## Activities Completed

### Environment Verification

Verified:

- Linux environment setup
- Required packages
- Docker installation
- OpenLane availability


### Repository Analysis

Studied the mixed-signal reference repository.

Analyzed:

- Verilog source files
- LEF files
- LIB files
- Technology files
- OpenLane flow configuration


### AI-Assisted Investigation

AI tools were used for:

- Understanding physical design concepts
- Debugging installation problems
- Explaining EDA tools
- Generating documentation
- Understanding errors and solutions


---

# Task 3 - Week 3

# RTL-to-GDSII Physical Design Flow Implementation

The third phase implemented the complete RTL-to-GDSII flow using OpenLane and OpenROAD.


# Selected Circuit Block

## 2:1 Analog Multiplexer (AMUX2_3V)


# Design Goal

The objective was:

- Verify AMUX functionality using Verilog simulation
- Perform RTL-to-GDSII physical implementation
- Generate final layout outputs using SKY130 technology


---

# AMUX Functional Simulation


The AMUX RTL functionality was verified using Icarus Verilog.


## Simulation Files

```
AMUX2_3V.v
AMUX2_3V_tb.v
amux.vcd
output.pdf
```


## Simulation Commands

```bash
iverilog AMUX2_3V.v AMUX2_3V_tb.v -o amux_sim

vvp amux_sim

gtkwave amux.vcd
```


The generated waveform was analyzed using GTKWave.


---

# OpenLane RTL-to-GDSII Flow


The following stages were completed:


## 1. SKY130 PDK Setup

Configured the SKY130 technology environment required for physical design.


## 2. Design Preparation

Prepared:

- RTL files
- Configuration files
- Technology libraries


## 3. Synthesis

RTL was converted into a gate-level netlist.

Generated:

- Synthesized Verilog
- Area reports
- Timing reports


## 4. Floorplanning

Defined:

- Core area
- Die area
- Placement boundaries


## 5. Placement

Placed standard cells inside the design area.


## 6. Clock Tree Synthesis

Generated clock distribution network.


## 7. Routing

Completed physical routing between cells.


## 8. Magic Layout Generation

Generated:

- MAG layout
- GDSII output


## 9. Verification

Performed:

- DRC checking
- Antenna checking
- LVS analysis


---

# Generated Outputs


The physical design flow generated:


## Layout Files

```
design_mux.gds
design_mux.mag
design_mux.lef
```


## Library Files

```
design_mux.lib
design_mux.sdf
```


## Reports

Generated reports include:

- Synthesis reports
- Placement reports
- CTS reports
- Routing reports
- Timing reports
- DRC reports
- LVS reports


---

# Task 4 - AI-Assisted Demonstration


The final phase demonstrates the complete AI-assisted circuit design workflow.


# Objective

To demonstrate how the design can be reproduced by another user using:

- AI assistance
- Generated circuit files
- Simulation commands
- Physical design flow
- Verification results


# AI Workflow


The workflow includes:


## 1. Problem Understanding

Used AI assistance to understand:

- Circuit requirement
- Design approach
- Expected outputs


## 2. Circuit Development

Generated and analyzed:

- Verilog design file
- Testbench
- Simulation environment


## 3. Simulation Verification

Executed:

```bash
iverilog AMUX2_3V.v AMUX2_3V_tb.v -o amux_sim

vvp amux_sim

gtkwave amux.vcd
```


Verified waveform output.


## 4. Physical Design Flow

Demonstrated:

- OpenLane execution
- RTL synthesis
- Floorplan
- Placement
- CTS
- Routing
- Layout generation


## 5. Debugging Process

AI assistance was used for:

- Understanding errors
- Finding solutions
- Improving documentation


---

# AI Tools Used

## ChatGPT

Used for:

- Concept explanation
- Command guidance
- Debugging
- Documentation generation
- Workflow planning


---

# Final Results


Completed successfully:


✅ Mixed-signal physical design study

✅ SKY130 PDK analysis

✅ OpenLane environment setup

✅ AMUX2_3V RTL simulation

✅ GTKWave waveform verification

✅ RTL-to-GDSII implementation

✅ Layout generation

✅ DRC and LVS analysis

✅ AI-assisted workflow demonstration


---

# Learning Outcomes


Through this internship, I gained hands-on experience in:


- Mixed-signal IC design concepts
- RTL design verification
- Physical design flow
- SKY130 technology
- OpenLane and OpenROAD tools
- Linux-based EDA workflow
- Layout generation
- Design verification
- AI-assisted engineering methodology


---

# Author

**Lokash Sri M**

VSD Mixed-Signal Physical Design Internship


