//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #3 - Up/Down counter
// Student Name:
// Date:
//
// Description: A testbench module to test Ex3 - counter
// Guidance: start with simple tests of the module (how should it react to each
// control signal?). Don't try to test everything at once - validate one part of
// the functionality at a time.
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
    );

    //Todo: Parameters
    parameter CLK_PERIOD = 10;

    //Todo: Regitsers and wires
    reg clk;
    reg rst;
    reg ebl;
    reg dir;
    reg [7:0] ctr;
    reg [7:0] prev_ctr;
    reg err;


    //Todo: Clock generation
    initial
    begin
       clk = 1'b0;
       forever
         #(CLK_PERIOD/2) clk=~clk;
     end


    //Todo: User logic

    //check if reset works
    initial begin
      rst = 1
      err = 0;
      forever begin
        #CLK_PERIOD
        if ((rst == 1) && (ctr != 8'b0))
        begin
          $display("***TEST FAILED! reset is 1 but ctr is not 0");
          err=1;
        end
        if(rst) rst = 0
      end
    end

    //Todo: Finish test, check for success
    initial begin
      #50
      if (err==0)
        $display("***TEST PASSED! :) ***");
      $finish;
    end

    //Todo: Instantiate counter module
    counter top(
        .rst (rst),
        .enable (ebl),
        .clk (clk),
        .direction (dir),
        .counter_out (ctr)
        );

endmodule
