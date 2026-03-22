`timescale 1ns/1ps
module rr_arbiter_4port_tb;
    parameter N = 4;
    reg clk, rst_n;
    reg [N-1:0] req;
    wire [N-1:0] grant;
    rr_arbiter_4port #(.N(N)) uut (.*);
    always #5 clk = ~clk;
    initial begin
        clk = 0; rst_n = 0; req = 0;
        #12 rst_n = 1;
        req = 4'b1010; #10; #10;
        req = 4'b1111; #10; #10; #10; #10;
        req = 4'b0001; #10; #10;
        $display("Test passed"); $finish;
    end
endmodule
