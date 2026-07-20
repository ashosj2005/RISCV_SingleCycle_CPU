# 32-bit Single Cycle RISC-V Processor

A Verilog implementation of a **32-bit Single Cycle RISC-V CPU** supporting arithmetic, memory, branch, and jump instructions.

---

# Architecture

<p align="center">
<img src="docs/architecture.png" width="900">
</p>

---

# Supported Instructions

| Type | Instructions |
|------|--------------|
| R-Type | ADD, SUB, AND, OR |
| I-Type | ADDI |
| Memory | LW, SW |
| Branch | BEQ |
| Jump | JAL |

---

# CPU Modules

- Program Counter
- Instruction Memory
- Register File
- Control Unit
- ALU
- ALU Decoder
- Immediate Generator
- Branch Immediate Generator
- JAL Immediate Generator
- ALU MUX
- Branch Comparator
- Branch Adder
- PC MUX
- Data Memory
- Write Back MUX

---

# Tools

- Verilog HDL
- Icarus Verilog
- GTKWave
- Ubuntu Linux

---

# Simulation

Compile

```bash
iverilog -o cpu_sim src/*.v tb/cpu_top_tb.v
```

Run

```bash
vvp cpu_sim
```

Waveform

```bash
gtkwave cpu_top.vcd
```

---

# Waveforms

| ADD/SUB | LW/SW |
|----------|-------|
| ![](waveform/add_sub.png) | ![](waveform/lw_sw.png) |

| BEQ | JAL |
|-----|-----|
| ![](waveform/beq.png) | ![](waveform/jal.png) |

---

# Future Work

- BNE
- BLT
- JALR
- Pipeline CPU
- Hazard Detection
- Forwarding Unit

---

## Author

**Asho Daniel SJ**

B.Tech VLSI Design and Technology

VIT Chennai
