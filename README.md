#  RISC-V 5-Stage Pipelined Processor (Verilog + ModelSim)

This project implements a simplified RISC-V processor using a 5-stage pipeline. It includes all major stages: **Instruction Fetch (IF), Instruction Decode (ID), Execute (EX), Memory (MEM), and Write Back (WB)**. The project is written in **Verilog** and simulated using **ModelSim**.

---

##  Folder Structure

riscv_pipeline_project/
├── rtl/                        # RTL (design) code
│   ├── pc.v                    # Program Counter
│   ├── instruction_memory.v   # Instruction memory (ROM)
│   ├── if_stage.v             # Instruction Fetch stage
│   ├── register_file.v        # Register file (x0–x31)
│   ├── id_stage.v             # Instruction Decode stage
│   ├── alu.v                  # Arithmetic Logic Unit
│   ├── ex_stage.v             # Execute stage (EX1)
│   ├── mem_stage.v            # Memory stage (MEM)
│   ├── wb_stage.v             # Write Back stage (WB)
│   ├── pipeline_registers.v   # Pipeline registers: IF/ID, ID/EX, EX/MEM, MEM/WB
│   └── pipeline_cpu.v         # Top-level CPU module (integrates all stages)
│
├── testbench/                 # Testbenches for simulation
│   ├── tb_if_stage.v          # IF stage testbench
│   ├── tb_id_stage.v          # ID stage testbench
│   ├── tb_ex_stage.v          # EX stage testbench
│   └── tb_pipeline_cpu.v      # Full pipeline testbench
│
└── README.md

---

##  Pipeline Overview

### ✔️ Pipeline Stages

| Stage | Module                | Description                            |
|-------|-----------------------|----------------------------------------|
| IF    | `if_stage.v`          | Fetches instruction from memory        |
| ID    | `id_stage.v`          | Decodes instruction and reads registers|
| EX    | `ex_stage.v`, `alu.v` | Performs ALU operations (ADD, SUB, etc.)|
| MEM   | `mem_stage.v`         | Placeholder for memory access          |
| WB    | `wb_stage.v`          | Writes back result to register file    |

---

##  How to Simulate in ModelSim

###  Step 1: Set Up Project

1. Open **ModelSim**
2. Create a new project in the root folder (`riscv_pipeline_project`)
3. Add all files from:
   - `rtl/`
   - `testbench/` (choose a testbench, e.g., `tb_pipeline_cpu.v`)
