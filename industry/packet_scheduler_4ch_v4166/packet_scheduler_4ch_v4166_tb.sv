`timescale 1ns/1ps
module packet_scheduler_4ch_tb;
    parameter N = 4, WIDTH = 8;
    reg clk, rst_n;
    reg [N-1:0] req;
    reg [N*WIDTH-1:0] data_in;
    wire [WIDTH-1:0] data_out;
    wire valid_out;
    wire [$clog2(N)-1:0] sel_out;
    packet_scheduler_4ch #(.N(N), .WIDTH(WIDTH)) uut (.*);
    always #5 clk = ~clk;
    initial begin
        clk=0; rst_n=0; req=0; data_in=0;
        #12 rst_n=1;
        data_in = {8'hD0, 8'hC0, 8'hB0, 8'hA0};
        req = 4'b1010; #10; #10;
        req = 4'b1111; #10; #10; #10;
        $display("Test passed"); $finish;
    end
endmodule
