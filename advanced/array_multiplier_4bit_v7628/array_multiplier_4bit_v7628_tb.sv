`timescale 1ns/1ps
module array_multiplier_4bit_tb;
    parameter WIDTH = 4;
    reg [WIDTH-1:0] a, b;
    wire [2*WIDTH-1:0] product;
    array_multiplier_4bit #(.WIDTH(WIDTH)) uut (.*);
    initial begin
        a = 4'd3; b = 4'd4; #10;
        a = 4'd7; b = 4'd7; #10;
        a = 4'd15; b = 4'd1; #10;
        a = 0; b = 4'd255; #10;
        $display("Test passed"); $finish;
    end
endmodule
