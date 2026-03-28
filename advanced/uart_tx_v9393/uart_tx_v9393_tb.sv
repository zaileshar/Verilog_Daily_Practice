`timescale 1ns/1ps
module uart_tx_tb;
    parameter CLK_FREQ = 50000, BAUD = 5000;
    reg clk, rst_n;
    reg [7:0] tx_data;
    reg tx_start;
    wire tx_out, tx_busy;
    uart_tx #(.CLK_FREQ(CLK_FREQ), .BAUD(BAUD)) uut (.*);
    always #5 clk = ~clk;
    initial begin
        clk = 0; rst_n = 0; tx_data = 0; tx_start = 0;
        #12 rst_n = 1;
        #20 tx_data = 8'h55; tx_start = 1; #10 tx_start = 0;
        wait(!tx_busy); #100;
        $display("Test passed"); $finish;
    end
endmodule
