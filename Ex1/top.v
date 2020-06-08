//////////////////////////////////////////////////////////////////////////////////
// Exercise #1
// Student Name: Devang Sehgal
// Date: 8 June 2020
//
//  Description: In this exercise, you need to design a logical unit, where the
//  output acts according to the following truth table:
//
//  a | b | out
// -----------------
//  0 | 0 | func[0]
//  0 | 1 | func [1]
//  1 | 0 | func [2]
//  1 | 1 | func [3]
//
//  inputs:
//           a, b, func[3:0]
//
//  outputs:
//           out
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module logicalunit(
    input a,
    input b,
    input [3:0] func,
    output out
    );

    wire   out;
    wire [1:0] ab = {a,b};
    //Todo: add you logic here
    //Use of simple nested ?: statements
    assign out = (ab == 2'd00)?func[0]:
    	(ab == 2'd01)?func[1]:
    	(ab == 2'd10)?func[2]:
    //If ab is not 00,01, 10, then it must be 11
    	func[3];


endmodule
