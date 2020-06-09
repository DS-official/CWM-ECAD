//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #3 - Up/Down counter
// Student Name:Devang Sehgal
// Date:9/6/2020
//
// Description: A testbench module to test Ex3 - counter
// Guidance: start with simple tests of the module (how should it react to each
// control signal?). Don't try to test everything at once - validate one part of
// the functionality at a time.
//////////////////////////////////////////////////////////////////////////////////
// all the tests are writtent below, but check change direction to check if down direction also works

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
    reg err;
    reg init; // flag to check if we are in first iteration
    reg count; // counter

    wire [7:0] ctr;
    reg [7:0] prev_ctr;



    //Todo: Clock generation
    initial
    begin
       clk = 1'b0;
       forever
         #(CLK_PERIOD/2) clk=~clk;
     end


    //Todo: User logic


    initial begin
      rst = 1;
      err = 0;
      ebl = 0;
      dir = 1;
      init = 0;
      count = 0;

      forever begin
        #CLK_PERIOD

        //check if reset works
        if ((rst == 1) && (ctr != 8'b0))
        begin
          $display("***TEST FAILED! reset is 1 but ctr is not 0");
          err=1;
        end
        if(rst) rst = 0;

        //check if enable keeps it unchanged
        if(init && (ebl==0) && (rst!=1) && (prev_ctr!=ctr))
        begin
          $display("***TEST FAILED! enable does not keep ctr same");
          err=1;
        end

        // check if direction pushes it up
        if(init && ebl && (rst!=1) && dir && (ctr != (prev_ctr+1)))
        begin
          $display("***TEST FAILED! dir =1 does not increment counter");
          err=1;
        end

	// check if direction takes it down
	if(init && ebl && (rst!=1) && (!dir) && (ctr != (prev_ctr-1)))
        begin
          $display("***TEST FAILED! dir =0 does not decrement counter");
          err=1;
        end

        prev_ctr = ctr;
        ebl = ~ebl;
	//if(count%4 == 3) dir = ~dir;
	//if ((count & 2'b11) == 2'b11) dir = ~dir;
	count = count + 1;
        if(!init) init = 1;
      end
    end

    //Todo: Finish test, check for success
    initial begin
      #200
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
