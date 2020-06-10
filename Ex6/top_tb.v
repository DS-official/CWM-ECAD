//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #6 - Dice or Traffic Lights?
// Student Name: Devang Sehgal
// Date: 10 June 2020
//
// Description: A testbench module to test Ex6 - Dice or Traffic Lights?
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module top_tb(
    );

    //Todo: Parameters
    parameter CLK_PERIOD = 10;
    reg rst;
    reg clk;
    reg btn;
    reg sel;
    reg err;
    reg init;

    wire [2:0] result;



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
       rst = 1;
       sel = 0;
       btn = 1;
       init = 0;
       #CLK_PERIOD
       forever begin
       #CLK_PERIOD

       //check if reset works
       if (rst && (sel==0) && (result != 3'b0) )
       begin
         $display("***TEST FAILED! reset is 1 and sel = 0 but result is not 0");
         err=1;
       end
       if(rst) rst = 0;


         end
     end

    //Todo: Finish test, check for success
    initial begin
      #200
      if (err==0)
        $display("***TEST PASSED! :) ***");
      $finish;
    end

    //instantiate dice_or_light
    dice_or_light top(
        .rst (rst),
        .clk (clk),
        .button (btn),
        .sel (sel),
        .result (result)
        );

endmodule
