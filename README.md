#Parameterized Verilog ALU
A parameterized Arithmetic Logic Unit (ALU) written in Verilog-2005 and verified using Icarus Verilog and GTKWave.

---

## Features
- Parameterized width (4-bit / 8-bit)
- ADD
- SUB
- AND
- OR
- XOR
- NOT
- Shift Left
- Shift Right
- Carry Flag
- Zero Flag
- Negative Flag
- Overflow Flag

---

## Opcode Table
|000|ADD|
|001|SUB|
|010|AND|
|011|OR|
|100|XOR|
|101|NOT|
|110|Shift Left|
|111|Shift Right|

---

## Project Structure

```
verilog-alu/
│
├── src/
│   └── alu.v
│
├── tb/
│   └── alu_tb.v
│
├── docs/
│   └── waveform.png
│
├── sim/
│
├── README.md
└── .gitignore
```

---

## How to Compile

```bash
iverilog -o sim/alu_sim src/alu.v tb/alu_tb.v
```

---

## Run Simulation

```bash
vvp sim/alu_sim
```

---

## Open GTKWave

```bash
gtkwave sim/alu.vcd
```
---

## Sample Output
```
SELF CHECKING TESTBENCH

ADD Test ........ PASS
SUB Test ........ PASS
AND Test ........ PASS
OR Test ......... PASS
XOR Test ........ PASS
NOT Test ........ PASS
SHL Test ........ PASS
SHR Test ........ PASS
Overflow Test ... PASS
```
---

## Waveform
``<img width="836" height="324" alt="image" src="https://github.com/user-attachments/assets/f3c3621b-0381-4b4a-9839-81d541e1cfc7" />
`


---

## Tools Used

- Verilog-2005
- Icarus Verilog
- GTKWave
- VS Code
- Git
- GitHub

---


---

## Author

Sher
