//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #4 - Electronic Dice
// Student Name:Devang Sehgal
// Date:9 June 2020
//
// Description: A testbench module to test Ex4 - Electronic Dice
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module top_tb(
    );

    //Todo: Parameters
    parameter CLK_PERIOD = 10;

    //Todo: Regitsers and wires
    reg clk;
    reg rst;
    reg err;
    reg btn;

    wire [2:0] throw;
    reg [2:0] prev_throw;



    //Todo: Clock generation
    initial
    begin
       clk = 1'b0;
       forever
         #(CLK_PERIOD/2) clk=~clk;
     end


    //Todo: User logic
    initial begin
      err = 0;
      #6
      forever begin
      
        end
    end




    //Todo: Finish test, check for success
    initial begin
      #50
      if (err==0)
        $display("***TEST PASSED! :) ***");
      $finish;
    end

    //Todo: Instantiate dice module
    dice top(
        .rst (rst),
        .button (btn),
        .clk (clk),
        .throw (throw)
        );

endmodule
