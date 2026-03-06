`timescale 1ns/1ps
module alu_32bit_tb;
    parameter WIDTH = 32;
    reg [WIDTH-1:0] a, b;
    reg [3:0] op;
    wire [WIDTH-1:0] result;
    wire zero;
    alu_32bit #(.WIDTH(WIDTH)) uut (.*);
    integer i;
    initial begin
        a = 32'd25; b = 32'd10;
        for (i = 0; i < 8; i = i + 1) begin
            op = i; #10;
        end
        $display("Test passed"); $finish;
    end
endmodule
