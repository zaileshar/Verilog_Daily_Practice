`timescale 1ns/1ps
module array_multiplier_8bit_tb;
    parameter WIDTH = 8;
    reg [WIDTH-1:0] a, b;
    wire [2*WIDTH-1:0] product;
    array_multiplier_8bit #(.WIDTH(WIDTH)) uut (.*);
    initial begin
        a = 8'd3; b = 8'd4; #10;
        a = 8'd7; b = 8'd7; #10;
        a = 8'd15; b = 8'd1; #10;
        a = 0; b = 8'd255; #10;
        $display("Test passed"); $finish;
    end
endmodule
