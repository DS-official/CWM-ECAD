//////////////////////////////////////////////////////////////////////////////////
// Exercise #7
// Student Name: Devang Sehgal
// Date: 11 June 2020
//
//  Description: In this exercise, you need to implement a times table of 0..7x0..7
//  using a memory.
//
//  inputs:
//           clk, a[2:0], b[2:0], read
//
//  outputs:
//           result[4:0]
// edit: should be result[5:0]
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module multiply(
    //Todo: add ports
    input clk,
    input [2:0] a,
    input [2:0] b,
    input read,
    output [5:0] result
    );


    //Todo: define registers and wires here
multiplier inst (
  .clka(clk),    // input wire clka
  .ena(read),      // input wire ena
  .wea(0),      // input wire [0 : 0] wea
  .addra({a,b}),  // input wire [5 : 0] addra
  .dina(0),    // input wire [5 : 0] dina
  .douta(result)  // output wire [5 : 0] douta
);
    //Todo: define your logic here


endmodule
