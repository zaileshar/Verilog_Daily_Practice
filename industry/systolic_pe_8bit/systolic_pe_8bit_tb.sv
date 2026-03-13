`timescale 1ns/1ps
module systolic_pe_8bit_tb;
    parameter WIDTH = 8;
    reg clk, rst_n;
    reg signed [WIDTH-1:0] a_in, b_in;
    reg signed [2*WIDTH-1:0] c_in;
    wire signed [WIDTH-1:0] a_out, b_out;
    wire signed [2*WIDTH-1:0] c_out;
    systolic_pe_8bit #(.WIDTH(WIDTH)) uut (.*);
    always #5 clk = ~clk;
    initial begin
        clk=0; rst_n=0; a_in=0; b_in=0; c_in=0;
        #12 rst_n=1;
        a_in=3; b_in=4; c_in=0; #10;
        a_in=2; b_in=5; c_in=c_out; #10;
        #20 $display("Test passed"); $finish;
    end
endmodule
