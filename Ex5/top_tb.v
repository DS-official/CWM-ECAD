//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #5 - Traffic Lights
// Student Name: Devang Sehgal
// Date: 9 June 2020
//
// Description: A testbench module to test Ex5 - Traffic Lights
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
    );

    //Todo: Parameters
    parameter CLK_PERIOD = 10;

    //Todo: Regitsers and wires
    reg clk;
    reg err;
    reg init;

    wire [2:0] lit;
    reg [2:0] prev_lit;



    //Todo: Clock generation
    initial
    begin
       clk = 1'b0;
       forever
         #(CLK_PERIOD/2) clk=~clk;
     end


    //Todo: User logic
    initial begin
      err=0;
      init = 0;
      forever begin
        #CLK_PERIOD
    if (init && (prev_lit == 3'b100) && (lit != 3'b110))
        begin
          $display("***TEST FAILED! red not going to red and amber ***");
          err=1;
        end
    if (init && (prev_lit == 3'b110) && (lit != 3'b001))
        begin
          $display("***TEST FAILED! red and amber not going to green ***");
          err=1;
        end
    if (init && (prev_lit == 3'b001) && (lit != 3'b010))
        begin
          $display("***TEST FAILED! green not going to amber ***");
          err=1;
        end
    if (init && (prev_lit == 3'b010) && (lit != 3'b100))
        begin
          $display("***TEST FAILED! amber not going to red ***");
          err=1;
        end
    if (init && ((lit == 3'b000)||(lit == 3'b101)||(lit == 3'b011)||(lit == 3'b111)))
        begin
          $display("***TEST FAILED! Went into an unwanted state  ***");
          err=1;
        end

      init = 1;
      prev_lit = lit;
      end
    end




    //Todo: Finish test, check for success
    initial begin
      #200
      if (err==0)
        $display("***TEST PASSED! :) ***");
      $finish;
    end

    //Todo: Instantiate traffic module
    traffic top(
        .clk (clk),
        .red (lit[2]),
        .amber (lit[1]),
        .green (lit[0])
        );

endmodule
