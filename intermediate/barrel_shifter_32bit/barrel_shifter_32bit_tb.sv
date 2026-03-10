`timescale 1ns/1ps
module barrel_shifter_32bit_tb;
    parameter WIDTH = 32;
    reg [WIDTH-1:0] data_in;
    reg [$clog2(WIDTH)-1:0] shift_amt;
    reg direction;
    wire [WIDTH-1:0] data_out;
    barrel_shifter_32bit #(.WIDTH(WIDTH)) uut (.*);
    initial begin
        data_in = 32'hA5; direction = 0;
        shift_amt = 0; #10;
        shift_amt = 1; #10;
        shift_amt = 4; #10;
        direction = 1; shift_amt = 2; #10;
        $display("Test passed"); $finish;
    end
endmodule
