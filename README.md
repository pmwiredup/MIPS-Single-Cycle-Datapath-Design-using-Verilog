# MIPS-Single-Cycle-Datapath-Design-using-Verilog

A complete implementation of a MIPS single-cycle processor datapath designed in Verilog for Xilinx Vivado. This project demonstrates the fundamental concepts of computer architecture and processor design through a fully functional single-cycle MIPS processor.

## 📋 Table of Contents
- [Overview](#overview)
- [Features](#features)
- [Architecture](#architecture)
- [Module Structure](#module-structure)
- [Getting Started](#getting-started)
- [Usage](#usage)
- [Testing](#testing)
- [File Structure](#file-structure)
- [Implementation Details](#implementation-details)
- [Contributing](#contributing)
- [License](#license)

## 🔍 Overview

This project implements a MIPS (Microprocessor without Interlocked Pipeline Stages) single-cycle datapath using Verilog HDL. The design follows the classic MIPS architecture where each instruction completes execution in a single clock cycle, making it ideal for educational purposes and understanding fundamental processor concepts.

## ✨ Features

- **Complete Single Cycle Implementation**: All instructions execute in one clock cycle
- **32-bit Architecture**: Full 32-bit data and address paths
- **Comprehensive Instruction Support**: 
  - R-type instructions (ADD, SUB, AND, OR, SLT, etc.)
  - I-type instructions (ADDI, LW, SW, BEQ, etc.)
  - J-type instructions (J, JAL)
- **Modular Design**: Individual hardware components for easy understanding
- **Full Datapath**: Complete implementation with all necessary control signals
- **Vivado Compatible**: Designed and tested on Xilinx Vivado Design Suite

## 🏗️ Architecture

The datapath implements the standard MIPS single-cycle architecture with the following key components:

### Core Components
- **Program Counter (PC)**: 32-bit program counter with increment and jump capabilities
- **Instruction Memory**: Stores and fetches program instructions
- **Register File**: 32 general-purpose 32-bit registers
- **ALU (Arithmetic Logic Unit)**: 32-bit ALU supporting multiple operations
- **Data Memory**: Handles load/store operations
- **Control Units**: Main control unit and ALU control unit
- **Multiplexers**: Data path selection and routing
- **Adders**: PC increment and branch address calculation

### Control Signals
- `RegDst`: Register destination selection (rt vs rd)
- `Jump`: Jump instruction control
- `ALUSrc`: ALU source selection (register vs immediate)
- `MemToReg`: Memory to register data selection
- `RegWrite`: Register write enable
- `MemRead/MemWrite`: Memory operation controls
- `Branch`: Branch instruction control
- `ALUOp[1:0]`: ALU operation type selection

## 🔧 Module Structure

### Main Module: `SCDataPath`
The top-level module that instantiates and connects all datapath components.

**Port Declaration:**
module SCDataPath(ALUOutput, PCCurrent, PC, reset, clock);
input clock, reset;
input [31:0] PC;
output [31:0] ALUOutput, PCCurrent;

**Key Internal Signals:**
- `Instruction[31:0]`: Current instruction from memory
- `ReadData1[31:0], ReadData2[31:0]`: Register file outputs
- `SignExtend[31:0]`: Sign-extended immediate value
- `Zero`: ALU zero flag for branch decisions

### Instantiated Components
1. **Instruction_Memory** (unit01): Fetches instructions based on PC
2. **FADDER32** (unit02, unit13): 32-bit adders for PC increment and branch address
3. **Sign_Extender** (unit03): Sign extends 16-bit immediate to 32-bit
4. **Shift_Left** (unit04, unit05): Left shift operations for addresses
5. **concatJuPC** (unit06): Concatenates PC and jump address
6. **MainControlUnit** (unit07): Generates main control signals
7. **MUX5Bit_2To1** (unit08): Selects destination register
8. **RegFile_32** (unit09, unit19): Register file for read/write operations
9. **ALUControlUnit** (unit10): Generates ALU control signals
10. **Mux32Bit_2To1** (unit11, unit15, unit16, unit18): Various data path multiplexers
11. **ALU32Bit** (unit12): Main arithmetic logic unit
12. **Data_Memory** (unit17): Data memory for load/store operations

## 🚀 Getting Started

### Prerequisites
- Xilinx Vivado Design Suite (2018.1 or later)
- Basic understanding of Verilog HDL
- Knowledge of Single Cycle MIPS architecture and Computer Organization

### Simulation
1. Add `TBSCDataPath.v` as simulation source
2. Run behavioral simulation
3. Observe waveforms and monitor outputs
4. Verify correct instruction execution

## 🧪 Testing

### Testbench: `TBSCDataPath`
The comprehensive testbench validates the datapath functionality:

module TBSCDataPath;
reg clock, reset;
reg [31:0] PC;
wire [31:0] ALUOutput, PCCurrent;

SCDataPath SCDP(ALUOutput, PCCurrent, PC, reset, clock);

**Test Features:**
- **Clock Generation**: 20ns period (50MHz frequency)
- **Reset Testing**: Validates reset functionality
- **PC Progression**: Tests program counter updates
- **Signal Monitoring**: Comprehensive output monitoring
- **Timing Verification**: Ensures proper timing relationships

**Test Sequence:**
1. Initialize with PC = 20, reset = 0
2. Assert reset after 15ns
3. Change PC to 12 after 25ns
4. Test PC auto-increment functionality
5. Monitor ALU outputs and PC progression

### Monitoring Output

$monitor($time, " :PC = %b, Reset = %b, Clock = %b, NextPC = %b, ALUOutput = %b.",
PC, reset, clock, PCCurrent, ALUOutput);

## 🔍 Implementation Details

### Clock Strategy
- **PC Update**: Updates on negative clock edge (`negedge clock`)
- **Memory Operations**: Synchronized to positive clock edge
- **Register File**: Dual-port with synchronized write operations

### Key Design Decisions
- **Single Cycle**: All operations complete in one clock cycle
- **Synchronous Design**: All sequential elements use the same clock
- **Modular Approach**: Each functional unit is a separate module

### Signal Flow
1. **Instruction Fetch**: PC → Instruction Memory → Instruction
2. **Decode**: Instruction → Control Units → Control Signals
3. **Execute**: Register File + ALU → Results
4. **Memory**: ALU Output → Data Memory (if needed)
5. **Write Back**: Results → Register File

## 🎯 Performance Characteristics

- **Clock Frequency**: Limited by critical path through datapath
- **Instructions Per Clock**: 1 (single cycle implementation)
- **Power Consumption**: Moderate due to single cycle operation

## 🔧 Customization

### Performance Optimization
- Pipeline implementation for higher throughput
- Cache integration for improved memory performance
- Branch prediction for reduced branch penalties

## 📚 References

- Patterson, D. A., & Hennessy, J. L. "Computer Organization and Design: The Hardware/Software Interface"
- Computer Architecture course lectures and lecture slides - BITS Pilani by Dr. Sudeept Mohan
- Xilinx Vivado Design Suite User Guide

## 📄 License

This project is licensed under the Apache2.0 license - see the [LICENSE](LICENSE) file for details.

---

**Educational Note**: This implementation is designed for educational purposes to demonstrate fundamental processor design concepts. It provides a clear understanding of how instructions flow through a processor datapath and how control signals coordinate the various functional units.

**Hardware Note**: While designed for FPGA implementation, this design prioritizes clarity and educational value over performance optimization. For production use, additional considerations such as timing closure, power optimization, and advanced features would be necessary.

