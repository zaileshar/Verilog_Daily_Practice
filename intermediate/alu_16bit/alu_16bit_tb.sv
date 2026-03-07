`timescale 1ns/1ps
module alu_16bit_tb;
    parameter WIDTH = 16;
    reg [WIDTH-1:0] a, b;
    reg [3:0] op;
    wire [WIDTH-1:0] result;
    wire zero;
    alu_16bit #(.WIDTH(WIDTH)) uut (.*);
    integer i;
    initial begin
        a = 16'd25; b = 16'd10;
        for (i = 0; i < 8; i = i + 1) begin
            op = i; #10;
        end
        $display("Test passed"); $finish;
    end
endmodule
