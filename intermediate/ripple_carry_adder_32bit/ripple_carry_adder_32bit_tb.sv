`timescale 1ns/1ps
module ripple_carry_adder_32bit_tb;
    parameter WIDTH = 32;
    reg [WIDTH-1:0] a, b;
    reg cin;
    wire [WIDTH-1:0] sum;
    wire cout;
    ripple_carry_adder_32bit #(.WIDTH(WIDTH)) uut (.*);
    initial begin
        a = 0; b = 0; cin = 0; #10;
        a = 32'd15; b = 32'd10; cin = 0; #10;
        a = 32'd255; b = 32'd1; cin = 0; #10;
        a = 32'd100; b = 32'd200; cin = 1; #10;
        $display("Test passed"); $finish;
    end
endmodule
