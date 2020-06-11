//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #7 - Times Table
// Student Name:Devang Sehgal
// Date: 11 June 2020
//
// Description: A testbench module to test Ex7 - Times Table
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module top_tb(
    );

    //Todo: Parameters
    parameter CLK_PERIOD = 10;
    reg err;
    reg init;
    reg clk;
    reg [2:0] a;
    reg [2:0] b;
    reg read;

    wire [5:0] result;

    //Todo: Clock generation
    initial begin
       clk = 1'b0;
       forever
         #(CLK_PERIOD/2) clk=~clk;
     end




     //Todo: User logic
     initial begin
       err = 0;
       init = 0;
       #CLK_PERIOD
       forever begin
       #CLK_PERIOD

       //check if reset works
       if (rst && (sel==0) && (result != 3'b001) )
       begin
         $display("***TEST FAILED! reset is 1 and sel = 0 but result is not 0");
         err=1;
       end
       if(rst) rst = 0;

       init = 1;
         end
     end



     //Todo: Finish test, check for success
     initial begin
       #300
       if (err==0)
         $display("***TEST PASSED! :) ***");
       $finish;
     end

     // instantiate multiply module
     multiply top(
         .clk (clk),
         .a (a),
         .b (b),
         .read (read),
         .result (result)
         );





endmodule
