# 🧠 RISC Processor in Verilog (VLSI)

## 🌐 Live Project Demo

👉 <a href="https://risc-processor-verilog-vlsi-project.onrender.com/" target="_blank" class="btn btn-green">
      ▶ RISC Processor in Verilog (VLSI)
    </a>

---

## 📌 Overview

This project implements a **32-bit RISC processor** using Verilog HDL.
It simulates the complete instruction execution cycle including **fetch, decode, execute, and write-back**.

---

## ⚙️ Features

* 32-bit architecture
* Program Counter (PC)
* Instruction Memory
* Register File (32 registers)
* ALU operations:

  * ADD
  * SUB
  * AND
  * OR
* Control Unit for instruction decoding
* Simulation using waveform analysis

---

## 🧩 Project Structure

```
risc_project/
│── alu.v
│── register_file.v
│── control_unit.v
│── program_counter.v
│── instruction_memory.v
│── data_memory.v
│── top_module.v
│── testbench.v
│── README.md
```

---

## ▶️ How to Run

### 1. Compile

```
iverilog -o risc.out *.v
```

### 2. Run Simulation

```
vvp risc.out
```

### 3. View Waveform

```
gtkwave dump.vcd
```

---

---

## 🔬 Run Live Simulation (No Setup Required)

You can run this RISC Processor directly in your browser using EDA Playground:

👉 https://www.edaplayground.com/x/JzJ3

### ⚡ Instructions
- Click the link above
- Click ▶ **Run**
- Waveform will open automatically (EPWave)

No installation required 🚀

---

## 📊 Sample Output

```
Time=0   PC=00000000 A=10 B=5 Result=15   (ADD)
Time=5   PC=00000004 A=10 B=5 Result=5    (SUB)
Time=15  PC=00000008 A=10 B=5 Result=0    (AND)
Time=25  PC=0000000c A=10 B=5 Result=15   (OR)
```

---

## 🌊 Waveform Analysis

Using GTKWave, the following signals can be observed:

* Program Counter (PC)
* Instruction
* ALU inputs (A, B)
* ALU result
* Control signals (alu_ctrl, reg_write)

---

## 🎯 Learning Outcomes

* Understanding of RISC architecture
* Verilog HDL design and simulation
* Digital design concepts (ALU, registers, control unit)
* Waveform debugging using GTKWave

---

## 🚀 Future Improvements

* Add Load/Store instructions
* Implement branching (BEQ, JUMP)
* Design pipelined processor (5-stage pipeline)
* Hazard detection and forwarding

---

## 👨‍💻 Author

**Nakshatra Meena**
