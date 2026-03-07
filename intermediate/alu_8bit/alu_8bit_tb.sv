`timescale 1ns/1ps
module alu_8bit_tb;
    parameter WIDTH = 8;
    reg [WIDTH-1:0] a, b;
    reg [3:0] op;
    wire [WIDTH-1:0] result;
    wire zero;
    alu_8bit #(.WIDTH(WIDTH)) uut (.*);
    integer i;
    initial begin
        a = 8'd25; b = 8'd10;
        for (i = 0; i < 8; i = i + 1) begin
            op = i; #10;
        end
        $display("Test passed"); $finish;
    end
endmodule
