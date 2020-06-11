//////////////////////////////////////////////////////////////////////////////////
// Exercise #8
// Student Name: Devang Sehgal
// Date: 11 June 2020
//
//  Description: In this exercise, you need to implement a times table of 0..7x0..7
//  using a memory and AXI-4-lite interface.
//
//  inputs:
//           clk, rst, a[2:0], b[2:0], enable
//
//  outputs:
//           result[5:0]
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module multiply_2(
    //Todo: add ports
    input clk,
    input rst,
    input [2:0] a,
    input [2:0] b,
    input enable,
    output [5:0] result
    );

    //Todo: define registers and wires here
    wire [31:0] address;
    wire rsta_busy;
    wire rstb_busy;
    wire s_axi_awready;
    wire s_axi_wready;
    wire [1:0] s_axi_bresp;
    wire s_axi_bvalid;
    wire s_axi_arready;
    wire s_axi_rresp;
    wire s_axi_rvalid;
    wire bram;

    assign bram = ((!rsta_busy) && (!rstb_busy));

    assign address = {24'd0, a,b, 2'd0};
    assign s_axi_arvalid = (enable && bram && s_axi_arready);
    assign s_axi_rready = (enable && bram && s_axi_rvalid);


times_table inst (
  .rsta_busy(rsta_busy),          // output wire rsta_busy
  .rstb_busy(rstb_busy),          // output wire rstb_busy
  .s_aclk(clk),                // input wire s_aclk
  .s_aresetn(rst),          // input wire s_aresetn
  .s_axi_awaddr(0),    // input wire [31 : 0] s_axi_awaddr
  .s_axi_awvalid(0),  // input wire s_axi_awvalid
  .s_axi_awready(s_axi_awready),  // output wire s_axi_awready
  .s_axi_wdata(0),      // input wire [31 : 0] s_axi_wdata
  .s_axi_wstrb(0),      // input wire [3 : 0] s_axi_wstrb
  .s_axi_wvalid(0),    // input wire s_axi_wvalid
  .s_axi_wready(s_axi_wready),    // output wire s_axi_wready
  .s_axi_bresp(s_axi_bresp),      // output wire [1 : 0] s_axi_bresp
  .s_axi_bvalid(s_axi_bvalid),    // output wire s_axi_bvalid
  .s_axi_bready(1),    // input wire s_axi_bready
  .s_axi_araddr(address),    // input wire [31 : 0] s_axi_araddr
  .s_axi_arvalid(s_axi_arvalid),  // input wire s_axi_arvalid
  .s_axi_arready(s_axi_arready),  // output wire s_axi_arready
  .s_axi_rdata(result),      // output wire [31 : 0] s_axi_rdata
  .s_axi_rresp(s_axi_rresp),      // output wire [1 : 0] s_axi_rresp
  .s_axi_rvalid(s_axi_rvalid),    // output wire s_axi_rvalid
  .s_axi_rready(s_axi_rready)    // input wire s_axi_rready
);



endmodule
