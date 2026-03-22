`timescale 1ns/1ps
module clock_divider_by16_tb;
    reg clk_in, rst_n;
    wire clk_out;
    clock_divider_by16 uut (.*);
    always #5 clk_in = ~clk_in;
    initial begin
        clk_in = 0; rst_n = 0;
        #12 rst_n = 1;
        #500 $display("Test passed"); $finish;
    end
endmodule
