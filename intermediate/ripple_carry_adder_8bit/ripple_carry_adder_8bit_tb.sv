`timescale 1ns/1ps
module ripple_carry_adder_8bit_tb;
    parameter WIDTH = 8;
    reg [WIDTH-1:0] a, b;
    reg cin;
    wire [WIDTH-1:0] sum;
    wire cout;
    ripple_carry_adder_8bit #(.WIDTH(WIDTH)) uut (.*);
    initial begin
        a = 0; b = 0; cin = 0; #10;
        a = 8'd15; b = 8'd10; cin = 0; #10;
        a = 8'd255; b = 8'd1; cin = 0; #10;
        a = 8'd100; b = 8'd200; cin = 1; #10;
        $display("Test passed"); $finish;
    end
endmodule
