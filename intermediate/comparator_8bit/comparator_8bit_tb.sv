`timescale 1ns/1ps
module comparator_8bit_tb;
    parameter WIDTH = 8;
    reg [WIDTH-1:0] a, b;
    wire eq, gt, lt;
    comparator_8bit #(.WIDTH(WIDTH)) uut (.*);
    initial begin
        a = 8'd10; b = 8'd10; #10;
        a = 8'd20; b = 8'd5; #10;
        a = 8'd3; b = 8'd15; #10;
        $display("Test passed"); $finish;
    end
endmodule
