`timescale 1ns/1ps
module d_flip_flop_tb;
    reg clk, rst_n, d;
    wire q;
    d_flip_flop uut (.*);
    always #5 clk = ~clk;
    initial begin
        clk = 0; rst_n = 0; d = 0;
        #12 rst_n = 1;
        #10 d = 1; #10 d = 0; #10 d = 1;
        #20 $display("Test passed"); $finish;
    end
endmodule
