# Dual Port RAM (Verilog HDL)
📌 Project Overview

This project implements a Dual Port RAM using Verilog HDL, allowing simultaneous read and write operations through two independent ports.

Dual Port RAM is widely used in high-performance digital systems where parallel data access is required, improving throughput compared to single-port memory.

⚙️ Features
Two independent ports:
Port A → Read/Write
Port B → Read/Write
Supports simultaneous operations
Synchronous design with clock control
Separate control signals for each port
Efficient and scalable RTL implementation


🧠 Design Approach
Memory is implemented as a register array
Each port has:
Address input
Data input/output
Write enable signal
Operation:
On every clock edge:
If we_a = 1 → Write via Port A
If we_b = 1 → Write via Port B
Otherwise, perform read operations
always @(posedge clk) begin
    if (we_a)
        mem[addr_a] <= din_a;
    dout_a <= mem[addr_a];

    if (we_b)
        mem[addr_b] <= din_b;
    dout_b <= mem[addr_b];
end


💡 Technical Insight
Dual Port RAM enables parallel access, improving performance in data-intensive designs
If both ports write to the same address simultaneously, it may lead to write conflicts (undefined behavior)
Proper arbitration or design constraints are required to handle such cases in real systems


🧪 Verification
Developed a testbench to validate:
Independent read/write operations
Simultaneous access from both ports
Verified functionality using waveform simulation in Vivado


🛠 Tools Used
Verilog HDL
Xilinx Vivado (Simulation & Synthesis)


🎯 Learning Outcomes
Understanding of multi-port memory architecture
Hands-on experience with parallel data access design
Improved knowledge of memory conflicts and arbitration concepts
Practical exposure to advanced RTL memory modeling


🚀 Future Improvements
Add true dual-clock support (independent clocks per port)
Implement conflict resolution logic
Extend to multi-port memory design
FPGA hardware implementation
