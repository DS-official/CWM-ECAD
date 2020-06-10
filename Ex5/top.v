//////////////////////////////////////////////////////////////////////////////////
// Exercise #5
// Student Name:Devang Sehgal
// Date: 9/6/2020
//
//  Description: In this exercise, you need to implement a UK traffic lights
//  sequencing system.
//
//  inputs:
//           clk
//
//  outputs:
//           red, amber, green
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module traffic(
    //Todo: add ports
    input clk,
    output red,
    output amber,
    output green
    );

    //Todo: add registers and wires, if needed
    reg red;
    reg amber;
    reg green;

    //Todo: add user logic
    always @ (posedge clk) begin
    if((red==1)&&(amber==0)&&(green==0)) begin
        red <= 1;
        amber <= 1;
        green <= 0;
    end
    else begin
        if((red==1)&&(amber==1)&&(green==0)) begin
            red <= 0;
            amber <= 0;
            green <= 1;
        end
        else begin
            if((red==0)&&(amber==0)&&(green==1)) begin
                red <= 0;
                amber <= 1;
                green <= 0;
            end
        // now default as red,0,0
            else begin
                red <= 1;
                amber <= 0;
                green <= 0;
            end
        end
    end
    end

    endmodule
