`default_nettype none
`timescale 1ns/1ps
module demux_1to4_1bit #(parameter WIDTH = 1) (
    input  [WIDTH-1:0] data_in,
    input  [1:0]       sel,
    output reg [WIDTH-1:0] y0, y1, y2, y3
);
    always @(*) begin
        y0 = 0; y1 = 0; y2 = 0; y3 = 0;
        case (sel)
            2'b00: y0 = data_in;
            2'b01: y1 = data_in;
            2'b10: y2 = data_in;
            2'b11: y3 = data_in;
        endcase
    end
endmodule

`default_nettype wire
