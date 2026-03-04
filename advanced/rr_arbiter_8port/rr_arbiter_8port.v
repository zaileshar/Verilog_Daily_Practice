`timescale 1ns/1ps
module rr_arbiter_8port #(parameter N = 8) (
    input              clk, rst_n,
    input  [N-1:0]     req,
    output reg [N-1:0] grant
);
    reg [$clog2(N)-1:0] last;
    integer i;
    reg found;
    always @(posedge clk or negedge rst_n)
        if (!rst_n) begin
            grant <= 0;
            last  <= 0;
        end else begin
            grant = 0;
            found = 0;
            for (i = 0; i < 2*N; i = i + 1) begin
                if (!found && req[(last + i + 1) % N]) begin
                    grant[(last + i + 1) % N] = 1;
                    last = (last + i + 1) % N;
                    found = 1;
                end
            end
        end
endmodule
