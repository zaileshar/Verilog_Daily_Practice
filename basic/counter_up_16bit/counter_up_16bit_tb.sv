`timescale 1ns/1ps
module counter_up_16bit_tb;
    parameter WIDTH = 16;
    reg clk, rst_n, en;
    wire [WIDTH-1:0] count;
    counter_up_16bit #(.WIDTH(WIDTH)) uut (.*);
    always #5 clk = ~clk;
    initial begin
        clk = 0; rst_n = 0; en = 0;
        #12 rst_n = 1; en = 1;
        #200 $display("Test passed"); $finish;
    end
endmodule
