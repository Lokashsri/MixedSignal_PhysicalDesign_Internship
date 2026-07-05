# Task 2 - Week 2: Commands

## 1. Environment Setup Commands

### Check Git version
```bash
git --version
```

### Check Python version
```bash
python3 --version
```

### Check CMake version
```bash
cmake --version
```

### Check GCC version
```bash
gcc --version
```

### Check Ubuntu version
```bash
lsb_release -a
```

---

## 2. Docker Installation Commands

### Update package list
```bash
sudo apt update -y
```

### Upgrade installed packages
```bash
sudo apt upgrade -y
```

### Verify Docker installation
```bash
sudo docker run hello-world
```

### List Docker images
```bash
docker images
```

If permission is denied:
```bash
sudo docker images
```

---

## 3. Repository Cloning

### Clone the reference repository
```bash
git clone https://github.com/praharshapm/vsdmixedsignalflow
```

### Clone OpenLane
```bash
git clone https://github.com/The-OpenROAD-Project/OpenLane.git
```

### Navigate into repository
```bash
cd ~/internship/vsdmixedsignalflow
```

### Display repository structure
```bash
tree -L 2
```

---

## 4. Repository Analysis Commands

### Read the beginning of README
```bash
head -80 README.md
```

### Display Verilog module
```bash
head -50 Verilog/AMUX2_3V.v
```

### Display LEF file
```bash
head -40 LEF/AMUX2_3V.lef
```

### Display LIB file
```bash
head -40 LIB/AMUX2_3V.lib
```

### Display OpenLane configuration
```bash
cat openlane/config.tcl
```

### Show repository tree
```bash
tree -L 2
```

---

## 5. OpenLane Project Setup

### Navigate to OpenLane
```bash
cd ~/internship/OpenLane
```

### Display OpenLane directory
```bash
ls
```

### Verify design folder
```bash
tree -L 2 ~/internship/OpenLane/designs/design_mux
```

### Verify source files
```bash
ls ~/internship/OpenLane/designs/design_mux/src
```

### Verify LEF files
```bash
ls ~/internship/OpenLane/designs/design_mux/lef
```

### Display configuration
```bash
cat ~/internship/OpenLane/designs/design_mux/config.tcl
```

---

## 6. Docker and OpenLane Verification

### List Docker images
```bash
docker images
```

### Verify Docker
```bash
sudo docker run hello-world
```

### Check current Git branch
```bash
git branch
```

### Check current OpenLane commit
```bash
git log --oneline -1
```
