`timescale 1ns / 1ps

module tb_dual_port_ram;

reg clk;

// Port A
reg we_a;
reg [3:0] addr_a;
reg [7:0] din_a;
wire [7:0] dout_a;

// Port B
reg we_b;
reg [3:0] addr_b;
reg [7:0] din_b;
wire [7:0] dout_b;


Design_1 uut (.clk(clk), .we_a(we_a), .addr_a(addr_a), .din_a(din_a), .dout_a(dout_a), .we_b(we_b), .addr_b(addr_b), .din_b(din_b), .dout_b(dout_b));

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    // Initialize
    we_a = 0; we_b = 0;
    addr_a = 0; addr_b = 0;
    din_a = 0; din_b = 0;
    #10;

    // Test 1: Write from Port A
    we_a = 1; addr_a = 4; din_a = 8'hAA;
    #10;
    we_a = 0;
    // Read from Port A
    addr_a = 4;
    #10;

    // Test 2: Write from Port B
    we_b = 1; addr_b = 7; din_b = 8'h55;
    #10;
    we_b = 0;
    addr_b = 7;
    #10;

    // Test 3: Parallel Access
    // A writes, B reads different addr
    we_a = 1; addr_a = 2; din_a = 8'hF0;
    we_b = 0; addr_b = 4;
    #10;
    we_a = 0;
    #10;

    // Test 4: Both Read

    addr_a = 2;
    addr_b = 7;
    #10;

    // Test 5: Write Conflict (Same Address)
    we_a = 1; addr_a = 5; din_a = 8'h11;
    we_b = 1; addr_b = 5; din_b = 8'h22;
    #10;
    we_a = 0; we_b = 0;
    #10;

    // Test 6: Read after Conflict
    addr_a = 5;
    addr_b = 5;
    #10;

    $finish;
end

endmodule
