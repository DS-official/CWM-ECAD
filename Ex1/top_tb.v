//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #1 - Logical Unit
// Author: Noa Zilberman
//
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
   //No ports are defined!
   );


    //Parameters
    parameter CLK_PERIOD = 10;

    //Registers
    reg clk;
    reg [1:0] ab;
    reg [3:0] func;
    reg err;

    //Wires
    wire out;


    //An initial block that creates the clock
    initial
    begin
       clk = 1'b0;
       forever
         #(CLK_PERIOD/2) clk=~clk;
     end

     //An initial block that drives the logic and tests output
     initial begin
       ab=0;
       err=0;
       func=4'hA;
       forever begin
         #CLK_PERIOD
         if (out!=func[{ab}])
         begin
           $display("***TEST FAILED! a==%d, b==%d, func='0xA', expected out=%d, actual out=%d ***",ab[1],ab[0],func[ab],out);
           err=1;
         end
         ab=ab+1;
       end
     end

     //An initial block that ends the simulation, and declares success (if valid)
     initial begin
        #50
        if (err==0)
          $display("***TEST PASSED! :) ***");
        $finish;
      end

     //The instantiation of the user's module
     logicalunit top (
     .a (ab[1]),
     .b (ab[0]),
     .func (func),
     .out (out)
     );



endmodule
