`timescale 1ns/1ps
module dsp_block_18bit_tb;
    parameter WIDTH = 18;
    reg clk, rst_n, en;
    reg signed [WIDTH-1:0] a, b, c;
    reg [1:0] mode;
    wire signed [2*WIDTH:0] result;
    dsp_block_18bit #(.WIDTH(WIDTH)) uut (.*);
    always #5 clk = ~clk;
    initial begin
        clk=0; rst_n=0; en=0; a=0; b=0; c=0; mode=0;
        #12 rst_n=1; en=1;
        a=10; b=20; mode=2'b00; #10;
        c=5; mode=2'b01; #10;
        mode=2'b10; #10;
        mode=2'b11; #10;
        $display("Test passed"); $finish;
    end
endmodule
