# Digital Systems Architecture Laboratory Exercises

A comprehensive collection of VHDL-based digital system implementations for the "Architettura dei Sistemi Digitali" (Digital Systems Architecture) course, academic year 2023.

## 📋 Overview

This repository contains a series of laboratory exercises that progressively build digital system design skills using VHDL and Xilinx Vivado. The exercises cover fundamental concepts from basic combinational circuits to complex sequential systems, including finite state machines, counters, multipliers, and memory systems.

## 👥 Team Members

- **Federica Del Vecchio**
- **Claudia Antonella Esposito** - [@ClaudiaEspo](https://github.com/ClaudiaEspo)
- **Tommaso Di Lillo**
- **Carolina Donato**

## 🗂️ Project Structure

```
├── esercizio_1/          # 16-to-4 Interconnect Network
├── esercizio_2/          # ROM-based Finite State Machine
├── esercizio_3/          # Pattern Recognition FSM
├── esercizio_4/          # Shift Register Implementation
├── esercizio_5/          # Digital Stopwatch System
├── esercizio_6/          # Advanced Control Unit
├── esercizio_7/          # Booth Multiplier
├── esercizio_8/          # Memory Management System
├── esercizio_9/          # Complex Digital System
├── esercizio_10/         # Serial Communication System
├── esercizio_11/         # Complete System Integration
├── esercizio a casa/     # Home Assignment
├── foto/                 # Documentation Images
└── ElaboratoGruppo17.pdf # Complete Project Report
```

## 🎯 Key Exercises

### Exercise 1: Interconnect Network
- **Components**: 16-to-1 multiplexer, 1-to-4 demultiplexer
- **Architecture**: Hierarchical structural design
- **Features**: Bidirectional data routing system

### Exercise 2: ROM-based FSM
- **Implementation**: Finite state machine using ROM memory
- **Components**: ROM memory, state machine controller
- **Target Board**: Nexys A7-100T FPGA

### Exercise 3: Pattern Recognition
- **Function**: Sequence detector for specific bit patterns
- **Type**: Mealy/Moore state machine implementation
- **Application**: Digital signal processing

### Exercise 4: Shift Register
- **Design**: Structural VHDL implementation
- **Components**: D flip-flops, multiplexers
- **Features**: Configurable shift operations

### Exercise 5: Digital Stopwatch
- **Features**: Hour/minute/second counters, lap timing
- **Display**: 7-segment display interface
- **Controls**: Start, stop, reset, lap functions
- **Clock**: Real-time clock generation and management

### Exercise 6: Control Unit
- **Architecture**: Advanced microprocessor control unit
- **Components**: Instruction decoder, sequencer
- **Memory**: ROM-based microcode storage

### Exercise 7: Booth Multiplier
- **Algorithm**: Booth's multiplication algorithm
- **Components**: Control unit, operational unit
- **Features**: Signed 8-bit multiplication
- **Display**: 7-segment result visualization

### Exercise 8: Memory System
- **Components**: Memory management unit, address counters
- **Features**: Multi-system memory coordination
- **Architecture**: Modular system design

### Exercise 10: Communication System
- **Protocol**: RS232 serial communication
- **Components**: UART, control units, memory interfaces
- **Integration**: Multi-system communication

### Exercise 11: Complete System
- **Integration**: Full digital system implementation
- **Features**: Combined functionality from all exercises
- **Testing**: Comprehensive system validation

## 🛠️ Technical Implementation

### Development Environment
- **HDL**: VHDL (IEEE Std 1076)
- **IDE**: Xilinx Vivado Design Suite
- **Target**: Nexys A7-100T FPGA Board
- **Synthesis**: Xilinx Synthesis Technology

### Key VHDL Components
- **Combinational Logic**: Multiplexers, demultiplexers, decoders
- **Sequential Logic**: Flip-flops, counters, shift registers
- **State Machines**: Finite state machines (FSM)
- **Memory**: ROM, RAM, memory management units
- **Arithmetic**: Booth multipliers, adders
- **Communication**: UART, serial interfaces
- **Display**: 7-segment display controllers

### Design Methodologies
- **Structural Design**: Component-based hierarchical architecture
- **Behavioral Design**: Process-based implementations
- **Mixed Design**: Combination of structural and behavioral approaches
- **Testbench Development**: Comprehensive simulation and verification

## 🚀 Getting Started

### Prerequisites
- Xilinx Vivado Design Suite (2020.2 or later)
- Nexys A7-100T FPGA development board
- Basic knowledge of VHDL and digital logic design

### Running the Exercises
1. **Open Project**: Launch Vivado and open the desired exercise project (`.xpr` file)
2. **Synthesis**: Run synthesis to check for design errors
3. **Implementation**: Execute place and route
4. **Bitstream Generation**: Generate programming file
5. **Programming**: Load bitstream to FPGA board
6. **Testing**: Use provided testbenches for simulation

### Simulation
```tcl
# Example simulation commands
run_simulation -type behavioral
run_simulation -time 1000ns
```

### Board Programming
```tcl
# Program FPGA board
open_hw_manager
connect_hw_server
program_hw_devices
```

## 📊 Exercise Features

### Combinational Systems
- Multiplexer/demultiplexer networks
- Encoder/decoder circuits
- Arithmetic logic units

### Sequential Systems
- Clock domain management
- Reset strategies
- State machine optimization

### Memory Systems
- ROM-based lookup tables
- RAM memory management
- Address generation and control

### Interface Systems
- 7-segment display controllers
- Button debouncing circuits
- Clock generation and distribution

## 🔧 Tools and Technologies

### Hardware Description Language
- **VHDL**: IEEE Standard 1076
- **Design Units**: Entity, architecture, configuration
- **Libraries**: IEEE standard libraries

### Development Tools
- **Xilinx Vivado**: Integrated development environment
- **ModelSim**: Advanced simulation platform
- **Synthesis Tools**: Xilinx synthesis technology

### Target Hardware
- **FPGA**: Xilinx Artix-7 XC7A100T
- **Board**: Digilent Nexys A7-100T
- **Resources**: 101,440 logic cells, 4,860 Kbits BRAM

## 📚 Documentation

Complete project documentation is available in:
- **ElaboratoGruppo17.pdf**: Comprehensive project report
- **Individual Exercise Reports**: Detailed analysis for each exercise
- **Schematics and Diagrams**: Visual system representations

---

**Institution**: Università degli Studi di Napoli "Federico II"  
**Course**: Architettura dei Sistemi Digitali  
**Academic Year**: 2023
