`timescale 1ns/1ps
module comparator_16bit_tb;
    parameter WIDTH = 16;
    reg [WIDTH-1:0] a, b;
    wire eq, gt, lt;
    comparator_16bit #(.WIDTH(WIDTH)) uut (.*);
    initial begin
        a = 16'd10; b = 16'd10; #10;
        a = 16'd20; b = 16'd5; #10;
        a = 16'd3; b = 16'd15; #10;
        $display("Test passed"); $finish;
    end
endmodule
