# Commands Used — Week 3 OpenLane Flow

> All terminal and Tcl commands used during the Week 3
> RTL-to-GDSII implementation flow for **design_mux**.

---

## 1. System Verification

```bash
# Check Ubuntu version
lsb_release -a

# Check tool versions
git --version
python3 --version
cmake --version
gcc --version
docker --version

# Check available memory and disk
free -h
df -h
```

---

## 2. PDK Setup

```bash
# Enable Sky130A PDK using Ciel
./venv/bin/ciel enable --pdk sky130A

# Verify PDK was installed
ls $PDK_ROOT/sky130A/
```

---

## 3. OpenLane Container Setup

```bash
# Navigate to OpenLane directory
cd ~/internship/OpenLane

# Set PDK root environment variable
export PDK_ROOT=~/internship/pdks

# Mount and start the OpenLane Docker container
make mount
```

---

## 4. Project Folder Setup (before launching flow)

```bash
# Create design folder structure
mkdir -p designs/design_mux/src/lef

# Copy Verilog source files
cp ~/vsdmixedsignalflow/Verilog/design_mux.v   designs/design_mux/src/
cp ~/vsdmixedsignalflow/Verilog/AMUX2_3V.v     designs/design_mux/src/
cp ~/vsdmixedsignalflow/Verilog/raven_spi.v    designs/design_mux/src/
cp ~/vsdmixedsignalflow/Verilog/spi_slave.v    designs/design_mux/src/

# Copy LEF file
cp ~/vsdmixedsignalflow/LEF/AMUX2_3V.lef      designs/design_mux/src/lef/

# Copy config.tcl
cp ~/vsdmixedsignalflow/openlane/config.tcl    designs/design_mux/

# Verify final structure
tree designs/design_mux/
```

---

## 5. RTL Fixes Before Flow (text edits)

```bash
# Fix 1 — Comment out duplicate include in raven_spi.v
sed -i 's/`include "spi_slave.v"/\/\/ `include "spi_slave.v"/' \
    designs/design_mux/src/raven_spi.v

# Fix 2 — Comment out duplicate include in design_mux.v
sed -i 's/`include "raven_spi.v"/\/\/ `include "raven_spi.v"/' \
    designs/design_mux/src/design_mux.v

# Fix 3 — Fix undriven wire IO → I0
sed -i 's/\.I0(IO)/.I0(I0)/' designs/design_mux/src/design_mux.v

# Verify fixes
grep -n "include" designs/design_mux/src/raven_spi.v
grep -n "include" designs/design_mux/src/design_mux.v
grep -n "I0"      designs/design_mux/src/design_mux.v
```

---

## 6. Launch OpenLane Interactive Flow

```bash
# Inside Docker container, launch interactive flow
./flow.tcl -interactive
```

---

## 7. OpenLane Tcl Commands (in order)

```tcl
# Load OpenLane package
package require openlane

# Prepare the design (loads config.tcl, creates run directory)
prep -design design_mux

# Inject custom analog macro LEF
set lefs [glob $::env(DESIGN_DIR)/src/lef/*.lef]
add_lefs -src $lefs

# ── Stage 1: Synthesis ─────────────────────────────────────────
run_synthesis

# ── Stage 2: Floorplanning ─────────────────────────────────────
run_floorplan

# ── Stage 3: Placement ─────────────────────────────────────────
run_placement

# ── Stage 4: Clock Tree Synthesis ──────────────────────────────
run_cts

# ── Stage 5: Routing ───────────────────────────────────────────
run_routing

# ── Stage 6: GDS Generation ────────────────────────────────────
run_magic

# ── Stage 7: DRC ───────────────────────────────────────────────
run_magic_drc

# ── Stage 8: LVS ───────────────────────────────────────────────
run_lvs

# ── Stage 9: Antenna Check ─────────────────────────────────────
run_antenna_check
```

---

## 8. Viewing Outputs in Magic

```bash
# View floorplan DEF
magic -T ~/sky130A.tech \
      lef read ~/merged.lef \
      def read designs/design_mux/runs/*/results/floorplan/design_mux.def

# View placement DEF
magic -T ~/sky130A.tech \
      lef read ~/merged.lef \
      def read designs/design_mux/runs/*/results/placement/design_mux.def

# View routed layout
magic -T ~/sky130A.tech \
      lef read ~/merged.lef \
      def read designs/design_mux/runs/*/results/routing/design_mux.def

# View DRC results
magic -T ~/sky130A.tech \
      designs/design_mux/runs/*/results/magic/design_mux.drc.mag

# View final GDS layout
magic -T ~/sky130A.tech \
      designs/design_mux/runs/*/results/magic/design_mux.mag
```

---

## 9. Viewing GDS in KLayout

```bash
# Open final GDS in KLayout
klayout designs/design_mux/runs/*/results/magic/design_mux.gds
```

---

## 10. Checking Results and Logs

```bash
# Check synthesis report
cat designs/design_mux/runs/*/reports/synthesis/1-synthesis.AREA_0.rpt

# Check DRC report
cat designs/design_mux/runs/*/logs/magic/magic.drc

# Check routing violations
cat designs/design_mux/runs/*/reports/routing/*.rpt

# List all generated output files
ls -lh designs/design_mux/runs/*/results/magic/

# Check final run log for errors
grep -i "error\|warning\|fail" \
     designs/design_mux/runs/*/logs/routing/*.log | tail -30
```

---

## 11. Docker Utility Commands

```bash
# List running containers
docker ps

# List all Docker images
docker images

# Free up Docker disk space (use with caution)
docker system prune -a

# Check Docker version
docker --version
```

---

## 12. General Linux Utility Commands

```bash
# List files with details
ls -lh

# Show current directory
pwd

# Search for text in files
grep -rn "AMUX2_3V" designs/design_mux/src/

# Find a file by name
find . -name "*.lef"

# Copy files
cp source destination

# Make a directory
mkdir -p path/to/folder

# Check disk usage
df -h

# Check memory usage
free -h

# Show file tree
tree designs/design_mux/
```
