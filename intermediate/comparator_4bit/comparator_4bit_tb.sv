`timescale 1ns/1ps
module comparator_4bit_tb;
    parameter WIDTH = 4;
    reg [WIDTH-1:0] a, b;
    wire eq, gt, lt;
    comparator_4bit #(.WIDTH(WIDTH)) uut (.*);
    initial begin
        a = 4'd10; b = 4'd10; #10;
        a = 4'd20; b = 4'd5; #10;
        a = 4'd3; b = 4'd15; #10;
        $display("Test passed"); $finish;
    end
endmodule
