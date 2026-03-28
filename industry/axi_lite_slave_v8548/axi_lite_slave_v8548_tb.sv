`timescale 1ns/1ps
module axi_lite_slave_tb;
    reg aclk, aresetn;
    reg [3:0] s_awaddr, s_araddr;
    reg [31:0] s_wdata;
    reg [3:0] s_wstrb;
    reg s_awvalid, s_wvalid, s_bready, s_arvalid, s_rready;
    wire s_awready, s_wready, s_bvalid, s_arready, s_rvalid;
    wire [1:0] s_bresp, s_rresp;
    wire [31:0] s_rdata;
    axi_lite_slave uut (.*);
    always #5 aclk = ~aclk;
    initial begin
        aclk=0; aresetn=0; s_awvalid=0; s_wvalid=0;
        s_bready=1; s_arvalid=0; s_rready=1;
        s_awaddr=0; s_wdata=0; s_wstrb=4'hF; s_araddr=0;
        #12 aresetn = 1;
        // Write
        s_awaddr=4'h0; s_wdata=32'hDEAD; s_awvalid=1; s_wvalid=1; #10;
        s_awvalid=0; s_wvalid=0; #10;
        // Read
        s_araddr=4'h0; s_arvalid=1; #10;
        s_arvalid=0; #10;
        $display("Test passed"); $finish;
    end
endmodule
