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
    reg init;

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
      rst = 1;
      btn = 0;
      init = 0;
      forever begin
      #CLK_PERIOD

      //check if reset works
      if (rst && (throw != 3'b001))
      begin
        $display("***TEST FAILED! reset is 1 but dice is not 1");
        err=1;
      end
      if(rst) rst = 0;

      if(init && ((prev_throw == 3'b000)||(prev_throw == 3'b111)) && (throw != 3'b001))
      begin
        $display("***TEST FAILED! '000' and '111' do not redirect properly");
        err=1;
      end

      //check button 0 keeps same
      if(init && (!btn) && (prev_throw != throw) && (prev_throw != 3'b000)&&(prev_throw != 3'b111))
      begin
        $display("***TEST FAILED! button = 0 does not stop the throw");
        err=1;
      end

      //check button 1 increments where it has to
      if(init && btn && (throw != (prev_throw + 1) )  && (prev_throw != 3'b000)&&(prev_throw != 3'b111) &&(prev_throw != 3'b110))
      begin
        $display("***TEST FAILED! button = 1 does not increment");
        err=1;
      end

      if(init && btn &&(prev_throw == 3'b110) && (throw != 3'b001))
      begin
        $display("***TEST FAILED! button = 1 does not work with 110");
        err=1;
      end


      init = 1;
      btn = ~btn;
      prev_throw = throw;

        end
    end




    //Todo: Finish test, check for success
    initial begin
      #200
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
