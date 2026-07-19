# Week 3 — Task Prompt

## Task Title

**RTL to GDSII Physical Design Flow using OpenLane**

---

## Objective

The objective of this task is to perform the complete RTL-to-GDSII
implementation flow for the given RTL design using the **OpenLane**
open-source ASIC design flow with the **Sky130A Process Design Kit (PDK)**.

The task includes executing every major stage of the physical design flow,
documenting the process, collecting screenshots, and generating the final
layout files.

---

## Design Used

| Component | Details |
|-----------|---------|
| **Top Module** | `design_mux` |
| **Analog Macro** | `AMUX2_3V` (2:1 analog multiplexer) |
| **SPI Controller** | `raven_spi` |
| **SPI Slave** | `spi_slave` |
| **Technology** | Sky130A — 130 nm open-source PDK |
| **Standard Cell Library** | `sky130_fd_sc_hd` |

---

## Tasks Performed

| # | Task | Status |
|---|------|--------|
| 1 | Configure the Sky130A PDK | ✅ Done |
| 2 | Launch the OpenLane environment | ✅ Done |
| 3 | Prepare the design using the OpenLane configuration | ✅ Done |
| 4 | Perform RTL synthesis | ✅ Done |
| 5 | Execute floorplanning | ✅ Done |
| 6 | Run placement | ✅ Done |
| 7 | Perform Clock Tree Synthesis (CTS) | ✅ Done |
| 8 | Execute global and detailed routing | ✅ Done |
| 9 | Generate GDSII and layout views using Magic | ✅ Done |
| 10 | Perform Magic Design Rule Check (DRC) | ✅ Done |
| 11 | Perform antenna rule checking | ✅ Done |
| 12 | Attempt Layout Versus Schematic (LVS) verification | ⚠️ Partial |
| 13 | Collect all generated design files | ✅ Done |
| 14 | Document the complete flow with screenshots and observations | ✅ Done |

---

## Expected Deliverables

### Screenshots
Screenshots of every major OpenLane stage — collected and stored in
the `screenshots/` folder.

### Documentation Files

| File | Description |
|------|-------------|
| `README.md` | Complete implementation flow description |
| `commands.md` | All terminal and Tcl commands used |
| `observations.md` | Stage-by-stage observations |
| `comparison.md` | Flow stage comparison table |
| `Week3_Prompt.md` | This task prompt file |

### Generated Output Files

| File | Description | Status |
|------|-------------|--------|
| `design_mux.gds` | Final GDSII layout (foundry format) | ✅ Generated |
| `design_mux.magic.gds` | Magic-format GDS | ✅ Generated |
| `design_mux.mag` | Magic editable layout file | ✅ Generated |
| `design_mux.lef` | Final abstract LEF file | ✅ Generated |
| `design_mux.lib` | Liberty timing file | ✅ Generated |
| `design_mux.sdf` | Standard Delay Format file | ✅ Generated |

---

## Learning Outcomes

By completing this task, the following concepts were understood and applied:

### Physical Design Concepts
- **OpenLane design flow** — end-to-end automated RTL-to-GDS pipeline
- **Sky130A PDK** — open-source 130 nm process design kit by SkyWater + Google
- **RTL synthesis using Yosys** — converting Verilog to gate-level netlist
- **Floorplanning** — defining chip area, macro placement, and power rings
- **Standard cell placement** — global and detailed placement with legalisation
- **Clock Tree Synthesis (CTS)** — distributing clock signal with low skew
- **Global and detailed routing** — TritonRoute metal interconnect generation
- **Physical verification using Magic DRC** — checking manufacturing rule compliance
- **Antenna rule checking** — preventing gate oxide damage during fabrication
- **GDSII layout generation** — producing the final chip layout file

### Debugging Skills
- **RTL debugging** — fixing duplicate module definitions and undriven wires
- **OpenLane configuration** — resolving deprecated variable names and config issues
- **LEF preparation** — understanding and fixing analog macro abstraction files
- **AI-assisted debugging** — using Claude and ChatGPT to diagnose and fix errors

### Tools Learned
- **OpenLane** — automated RTL-to-GDS flow
- **OpenROAD** — placement, CTS, routing engine
- **Yosys** — RTL synthesis
- **Magic** — layout editor, GDS export, DRC
- **KLayout** — GDS viewer
- **Docker** — containerised tool environment
- **Sky130A PDK** — technology files, timing libraries, design rules

---

## Repository Structure

```
Week3/
├── README.md                  ← Complete flow description
├── commands.md                ← All commands used
├── observations.md            ← Stage-by-stage observations
├── comparison.md              ← Flow comparison table
├── Week3_Prompt.md            ← This file
├── screenshots/               ← Flow output screenshots
│   ├── synthesis/
│   ├── floorplan/
│   ├── placement/
│   ├── routing/
│   ├── drc/
│   └── final_gds/
└── generated_files/           ← AI-generated and output files
    ├── config.tcl
    ├── AMUX2_3V.lef
    ├── AMUX2_3V.lib
    ├── design_mux.v
    └── interactive_flow.tcl
```

---

## References

1. OpenLane — [github.com/The-OpenROAD-Project/OpenLane](https://github.com/The-OpenROAD-Project/OpenLane)
2. SKY130 PDK — [github.com/google/skywater-pdk](https://github.com/google/skywater-pdk)
3. vsdmixedsignalflow — [github.com/praharshapm/vsdmixedsignalflow](https://github.com/praharshapm/vsdmixedsignalflow)
4. OpenROAD — [theopenroadproject.org](https://theopenroadproject.org)
5. Magic VLSI — [opencircuitdesign.com/magic](http://opencircuitdesign.com/magic)
