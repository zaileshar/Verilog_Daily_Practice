`timescale 1ns/1ps
module mac_unit_8bit_tb;
    parameter WIDTH = 8;
    reg clk, rst_n, en;
    reg signed [WIDTH-1:0] a, b;
    wire signed [2*WIDTH:0] acc;
    mac_unit_8bit #(.WIDTH(WIDTH)) uut (.*);
    always #5 clk = ~clk;
    initial begin
        clk = 0; rst_n = 0; en = 0; a = 0; b = 0;
        #12 rst_n = 1; en = 1;
        a = 3; b = 4; #10;
        a = 5; b = 6; #10;
        a = -2; b = 7; #10;
        #20 $display("Test passed"); $finish;
    end
endmodule
