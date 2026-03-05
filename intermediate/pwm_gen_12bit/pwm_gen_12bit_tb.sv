`timescale 1ns/1ps
module pwm_gen_12bit_tb;
    parameter WIDTH = 12;
    reg clk, rst_n;
    reg [WIDTH-1:0] duty;
    wire pwm_out;
    pwm_gen_12bit #(.WIDTH(WIDTH)) uut (.*);
    always #5 clk = ~clk;
    initial begin
        clk = 0; rst_n = 0; duty = 0;
        #12 rst_n = 1; duty = 12'd128;
        #5000 $display("Test passed"); $finish;
    end
endmodule
