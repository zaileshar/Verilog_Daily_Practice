`timescale 1ns/1ps
module axi_lite_slave #(
    parameter ADDR_WIDTH = 4,
    parameter DATA_WIDTH = 32
) (
    input                        aclk, aresetn,
    // Write address
    input  [ADDR_WIDTH-1:0]      s_awaddr,
    input                        s_awvalid,
    output reg                   s_awready,
    // Write data
    input  [DATA_WIDTH-1:0]      s_wdata,
    input  [DATA_WIDTH/8-1:0]    s_wstrb,
    input                        s_wvalid,
    output reg                   s_wready,
    // Write response
    output reg [1:0]             s_bresp,
    output reg                   s_bvalid,
    input                        s_bready,
    // Read address
    input  [ADDR_WIDTH-1:0]      s_araddr,
    input                        s_arvalid,
    output reg                   s_arready,
    // Read data
    output reg [DATA_WIDTH-1:0]  s_rdata,
    output reg [1:0]             s_rresp,
    output reg                   s_rvalid,
    input                        s_rready
);
    localparam NUM_REGS = (1 << ADDR_WIDTH) / (DATA_WIDTH/8);
    reg [DATA_WIDTH-1:0] regs [0:NUM_REGS-1];
    integer i;
    wire [ADDR_WIDTH-1:0] wr_idx = s_awaddr >> $clog2(DATA_WIDTH/8);
    wire [ADDR_WIDTH-1:0] rd_idx = s_araddr >> $clog2(DATA_WIDTH/8);

    always @(posedge aclk or negedge aresetn)
        if (!aresetn) begin
            s_awready <= 0; s_wready <= 0;
            s_bvalid <= 0; s_bresp <= 0;
            s_arready <= 0; s_rvalid <= 0; s_rresp <= 0; s_rdata <= 0;
            for (i = 0; i < NUM_REGS; i = i + 1) regs[i] <= 0;
        end else begin
            // Write
            if (s_awvalid && s_wvalid && !s_bvalid) begin
                s_awready <= 1; s_wready <= 1;
                regs[wr_idx] <= s_wdata;
                s_bvalid <= 1; s_bresp <= 2'b00;
            end else begin
                s_awready <= 0; s_wready <= 0;
            end
            if (s_bvalid && s_bready) s_bvalid <= 0;
            // Read
            if (s_arvalid && !s_rvalid) begin
                s_arready <= 1;
                s_rdata <= regs[rd_idx];
                s_rvalid <= 1; s_rresp <= 2'b00;
            end else s_arready <= 0;
            if (s_rvalid && s_rready) s_rvalid <= 0;
        end
endmodule
