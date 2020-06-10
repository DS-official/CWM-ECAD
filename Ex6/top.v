//////////////////////////////////////////////////////////////////////////////////
// Exercise #6
// Student Name: Devang Sehgal
// Date: 10/6/2020
//
//
//  Description: In this exercise, you need to design a multiplexer between a dice and traffic
//  lights, where the output acts according to the following truth table:
//
//  sel | out
// -----------------
//   0  | dice
//   1  | traffic lights
//
//  inputs:
//           rst, clk, button,sel
//
//  outputs:
//           result[2:0]
//
//////////////////////////////////////////////////////////////////////////////////


`timescale 1ns / 100ps

module dice_or_light(
    //Todo: add ports
    input rst,
    input clk,
    input button,
    input sel,
    output [2:0] result
    );



    //Todo: define registers and wires here
    wire [2:0] result;
    wire [2:0] lit;
    wire [2:0] throw;


    //Todo: define your logic here
    // is sel == 1, then result is traffic lights, else result is throw
    assign #1 result = sel ? lit : throw;



    //instantiate dice
    dice inst_dice(
        .rst (rst),
        .clk (clk),
        .button (button),
        .throw (throw)
        );

    //instantiate light

    traffic inst_traffic(
        //Todo: add ports
        .clk (clk),
        .red (lit[2]),
        .amber (lit[1]),
        .green (lit[0])
        );



endmodule
