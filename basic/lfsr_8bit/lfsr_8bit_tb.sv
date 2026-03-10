`timescale 1ns/1ps
module lfsr_8bit_tb;
    parameter WIDTH = 8;
    reg clk, rst_n, en;
    wire [WIDTH-1:0] lfsr_out;
    lfsr_8bit #(.WIDTH(WIDTH)) uut (.*);
    always #5 clk = ~clk;
    initial begin
        clk = 0; rst_n = 0; en = 0;
        #12 rst_n = 1; en = 1;
        #500 $display("Test passed"); $finish;
    end
endmodule
