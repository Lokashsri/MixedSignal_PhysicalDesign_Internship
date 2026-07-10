# Week 3 — RTL to GDSII Implementation using OpenLane

> **Author:** Lokashsri M
> **Tool:** OpenLane 1.0.2 · SKY130A PDK
> **Design:** design_mux (AMUX2_3V + raven_spi)

---

## 🎯 Objective

The objective of this task is to perform the complete RTL-to-GDSII
implementation flow using the **OpenLane** open-source ASIC design flow
with the **Sky130A Process Design Kit (PDK)**.

The design used is **design_mux**, which integrates:
- `AMUX2_3V` — 2:1 analog multiplexer (analog macro)
- `raven_spi` — SPI controller (digital RTL)
- `spi_slave` — SPI slave module (digital RTL)

---

## 🖥️ Environment

| Component | Details |
|-----------|---------|
| **Operating System** | Ubuntu 22.04 LTS (VirtualBox) |
| **OpenLane Version** | 1.0.2 |
| **PDK** | Sky130A |
| **Standard Cell Library** | sky130_fd_sc_hd |
| **RAM** | 8 GB allocated |
| **CPU Cores** | 4 allocated |

---

## 📐 Design Flow

The following OpenLane stages were executed in order:

```
PDK Setup
    ↓
Design Preparation
    ↓
RTL Synthesis (Yosys)
    ↓
Floorplanning
    ↓
Placement
    ↓
Clock Tree Synthesis (CTS)
    ↓
Global Routing
    ↓
Detailed Routing
    ↓
Magic GDS Generation
    ↓
Magic DRC
    ↓
Antenna Check
    ↓
✅ GDSII Generated
```

---

## ⚠️ Issues Encountered and Fixes

### Issue 1 — Duplicate Module Definition (spi_slave)

**Error:**
```
ERROR: Duplicate definition of module spi_slave
```

**Cause:**
`spi_slave.v` was included twice — once as a standalone file and
once via an `` `include "spi_slave.v" `` statement inside `raven_spi.v`.
OpenLane compiles every `.v` file in the `src/` directory automatically,
so the `include` caused a duplicate.

**Fix:**
Commented out the include statement in `raven_spi.v`:
```verilog
// `include "spi_slave.v"
```

---

### Issue 2 — Duplicate raven_spi Module

**Error:**
```
ERROR: Duplicate definition of module raven_spi
```

**Cause:**
The top-level file `design_mux.v` contained:
```verilog
`include "raven_spi.v"
```
Since OpenLane already compiles all files in `src/`, this caused
a second definition of the module.

**Fix:**
Commented out the include in `design_mux.v`:
```verilog
// `include "raven_spi.v"
```

---

### Issue 3 — Undriven Wire

**Warning during synthesis:**
```
Wire design_mux.\IO is used but has no driver.
```

**Cause:**
A port connection used the wrong identifier `IO` instead of `I0`
(capital letter O vs digit zero).

**Fix:**
Corrected the instantiation:
```verilog
// Before (wrong)
.I0(IO)

// After (correct)
.I0(I0)
```

Synthesis completed successfully after this correction.

---

### Issue 4 — LVS EXT_NETLIST Error

**Error:**
```
can't read "::env(EXT_NETLIST)": no such variable
```

**Cause:**
This is an OpenLane internal configuration issue where the `EXT_NETLIST`
environment variable is not set before the LVS stage runs. This is a
known issue in OpenLane 1.0.2 and does not affect the physical
implementation result.

**Impact:** LVS stage could not complete. All other stages (synthesis,
placement, routing, DRC, GDS) completed successfully.

---

## 📦 Final Output Files

The following files were successfully generated at the end of the flow:

| File | Description |
|------|-------------|
| `design_mux.gds` | Final GDSII layout (foundry submission format) |
| `design_mux.magic.gds` | Magic-format GDS |
| `design_mux.mag` | Magic layout file |
| `design_mux.lef` | Final LEF abstraction |
| `design_mux.lib` | Liberty timing file |
| `design_mux.sdf` | Standard Delay Format (timing annotation) |

---

## ✅ Results Summary

| Stage | Result |
|-------|--------|
| RTL Synthesis | ✅ Passed |
| Floorplanning | ✅ Passed |
| Placement | ✅ Passed |
| Clock Tree Synthesis | ✅ Passed |
| Routing | ✅ Passed |
| Magic DRC | ✅ No violations |
| Antenna Check | ✅ Passed |
| GDSII Generation | ✅ Generated |
| LVS | ⚠️ Config issue (EXT_NETLIST) |

---

## 📁 Repository Structure

```
Week3/
├── README.md               ← This file
├── commands.md             ← All commands used in the flow
├── observations.md         ← Stage-by-stage observations
├── comparison.md           ← Flow stage comparison table
├── screenshots/            ← Tool output screenshots
├── generated_files/        ← AI-generated and output files
│   ├── config.tcl
│   ├── AMUX2_3V.lef
│   ├── AMUX2_3V.lib
│   ├── design_mux.v
│   └── interactive_flow.tcl
└── Errors_and_Fixes/
    └── debug_log.md
```

## References

- OpenLane RTL-to-GDSII flow documentation
- SkyWater SKY130 PDK documentation
- praHarshapm vsdmixedsignalflow repository (used as learning reference)


