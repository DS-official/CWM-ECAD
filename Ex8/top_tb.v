//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #8 - Times Table using AXI interface
// Student Name: Devang Sehgal
// Date: 11 June 2020
//
// Description: A testbench module to test Ex8 - Times Table using AXI4-Lite
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
    reg rst;
    reg [2:0] a;
    reg [2:0] b;
    reg enable;
    reg [3:0] count;

    wire [5:0] result;
    reg [5:0] prev_result;

    //Todo: Clock generation
    initial begin
       clk = 1'b0;
       forever
         #(CLK_PERIOD/2) clk=~clk;
     end




     //Todo: User logic
     initial begin
       err = 0;
       rst = 0;
       init = 0;
       count = 0;
       a = 1;
       b = 2;
       read = 0;
       #CLK_PERIOD
       forever begin
       #50

       //check if reset works
       if (!rst && (result!=0))
       begin
         $display("***TEST FAILED! enable not working");
         err=1;
       end
       if(rst) rst = 0;

       //check if enable works
        if (init && (enable==0) && (result != prev_result) )
        begin
          $display("***TEST FAILED! enable not working");
          err=1;
        end

	//check for an arbitrary number
	if (enable && (a==3'd3) && (b == 3'd3) && (result != 6'd9))
        begin
          $display("***TEST FAILED! 3*3 is not coming as 9");
          err=1;
        end


    init = 1;
	count = count + 1;
	a = a+1;
	if (a == 0) b = b+1;
	prev_result = result;
    enable = 1;
	if(count == 4'b1010) enable = 0;
         end
     end



     //Todo: Finish test, check for success
     initial begin
       #500
       if (err==0)
         $display("***TEST PASSED! :) ***");
       $finish;
     end

     // instantiate multiply module
     multiply_2 top(
         .clk (clk),
         .rst (rst),
         .a (a),
         .b (b),
         .enable (enable),
         .result (result)
         );





endmodule
