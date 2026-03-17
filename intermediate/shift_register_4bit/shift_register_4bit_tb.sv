`timescale 1ns/1ps
module shift_register_4bit_tb;
    parameter WIDTH = 4;
    reg clk, rst_n, load, shift_en, serial_in;
    reg [WIDTH-1:0] parallel_in;
    wire [WIDTH-1:0] parallel_out;
    wire serial_out;
    shift_register_4bit #(.WIDTH(WIDTH)) uut (.*);
    always #5 clk = ~clk;
    initial begin
        clk=0; rst_n=0; load=0; shift_en=0; serial_in=0; parallel_in=0;
        #12 rst_n = 1;
        load = 1; parallel_in = 4'hA5; #10;
        load = 0; shift_en = 1; serial_in = 1;
        #80 $display("Test passed"); $finish;
    end
endmodule
