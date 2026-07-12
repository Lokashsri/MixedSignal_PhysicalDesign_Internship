# Task 4: AI-Assisted Circuit Design Demonstration

## Overview

This task demonstrates an AI-assisted mixed-signal circuit design workflow completed as part of the VSD Mixed-Signal Physical Design Internship.

The objective of this work is to demonstrate how AI tools can assist in moving from a circuit design requirement to a verified R
TL implementation by helping with design understanding, Verilog generation, testbench creation, debugging, simulation, and documentation.

The selected circuit block for this demonstration is a **2:1 Analog Multiplexer (AMUX2_3V)**.

The complete workflow includes:

- Understanding the circuit requirement
- AI-assisted Verilog RTL generation
- Testbench development
- Functional simulation
- Waveform verification
- Debugging and fixing issues
- Documentation of AI prompts, commands, and observations

---

# Demonstration Video

The complete screen-recorded demonstration video explaining the AI-assisted workflow is available below:

**Video Link:**  

YOUR_VIDEO_LINK_HERE

---

# Reference Repository

The reference flow and learning resources were based on the VSD Mixed-Signal Physical Design workflow using SKY130 PDK, OpenLane, and OpenROAD tools.

Reference repository:

https://github.com/praharshapm/vsdmixedsignalflow

The reference flow helped in understanding:

- Mixed-signal IP design concepts
- SKY130 technology files
- RTL-to-GDSII physical design flow
- Analog macro integration concepts
- Physical verification steps

---

# Selected Circuit Block

## 2:1 Analog Multiplexer (AMUX2_3V)

A 2:1 Analog Multiplexer selects one of two input signals and transfers the selected input signal to the output based on the select control signal.

## Design Objective

The goal of this demonstration is to verify the functional behaviour of the AMUX2_3V circuit and show how AI assistance was used throughout the design workflow.

Expected outputs:

- Functional Verilog RTL design
- Verification testbench
- Simulation waveform
- AI prompt documentation
- Reproducible design workflow

---

# Repository Contents

```
task4_ai_assisted_demonstration
│
├── AMUX2_3V.v
│       Verilog RTL design of 2:1 Analog Multiplexer
│
├── AMUX2_3V_tb.v
│       Testbench for functional verification
│
├── Prompts.md
│       AI prompts used during the design workflow
│
├── Commands.md
│       Commands executed during simulation
│
├── Screenshots/
│       Screenshots of workflow and results
│
├── amux.vcd
│       Simulation waveform output
│
├── output.pdf
│       Generated documentation/results
│
└── Observations.md
        Errors, debugging steps, and final observations
```

---

# AI Tool Used

## AI Assistant: ChatGPT

ChatGPT was used as an AI design assistant for:

- Understanding the circuit specification
- Generating Verilog RTL structure
- Creating testbench code
- Debugging syntax and simulation issues
- Improving documentation
- Explaining design concepts

All important AI prompts used during the workflow are included in this repository.

---

# Tools Used

| Tool | Purpose |
|------|---------|
| ChatGPT | AI-assisted design, debugging, and documentation |
| Verilog | RTL design description |
| Icarus Verilog | RTL compilation and simulation |
| GTKWave | Waveform analysis |
| SKY130 PDK | Semiconductor technology files |
| OpenLane | RTL-to-GDSII physical design flow |
| OpenROAD | Physical design implementation |

---

# Simulation Flow

The RTL design and testbench were simulated using Icarus Verilog.

## Compilation

```bash
iverilog -o amux_sim AMUX2_3V.v AMUX2_3V_tb.v
```

## Simulation Execution

```bash
vvp amux_sim
```

The simulation generates a VCD waveform file:

```
amux.vcd
```

The waveform was analysed using GTKWave to verify the multiplexer functionality.

---

# Errors Faced and Fixes

During the workflow, some issues were encountered during design and simulation.

Examples:

- Verilog syntax corrections
- Testbench modification
- Simulation command verification
- File organization improvements

The debugging process and fixes are documented in:

- Commands.md
- Observations.md
- Prompts.md

---

# Physical Design Workflow Study

The verified RTL design was studied with respect to the RTL-to-GDSII flow using OpenLane and SKY130 technology.

The physical design stages include:

1. RTL Synthesis
2. Floorplanning
3. Placement
4. Clock Tree Synthesis
5. Routing
6. Layout Generation
7. DRC Verification

The corresponding physical design outputs and screenshots are available in the internship repository.

---

# Results and Observations

The completed AI-assisted workflow successfully produced:

- Verilog RTL implementation of AMUX2_3V
- Functional verification testbench
- Simulation waveform output
- AI interaction documentation
- Reproducible commands and workflow
- Physical design flow understanding

This repository contains all required files, prompts, commands, screenshots, and results to reproduce the demonstrated workflow.
