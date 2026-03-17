`timescale 1ns/1ps
module shift_register_4bit #(parameter WIDTH = 4) (
    input              clk, rst_n, load, shift_en, serial_in,
    input  [WIDTH-1:0] parallel_in,
    output [WIDTH-1:0] parallel_out,
    output             serial_out
);
    reg [WIDTH-1:0] sr;
    assign parallel_out = sr;
    assign serial_out = sr[WIDTH-1];
    always @(posedge clk or negedge rst_n)
        if (!rst_n)       sr <= 0;
        else if (load)    sr <= parallel_in;
        else if (shift_en) sr <= {sr[WIDTH-2:0], serial_in};
endmodule
