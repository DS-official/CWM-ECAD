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
       init = 0;
       count = 0;
       a = 0;
       b = 0;
       read = 0;
       #CLK_PERIOD
       forever begin
       #CLK_PERIOD

       //check if read works
        if (init && (read==0) && (result != prev_result) )
        begin
          $display("***TEST FAILED! enable not working");
          err=1;
        end

	//check for an arbitrary number
	if (read && (a==3'd3) && (b == 3'd3) && (result != 6'd9))
        begin
          $display("***TEST FAILED! 3*3 is not coming as 9");
          err=1;
        end


    init = 1;
	count = count + 1;
	a = a+1;
	if (a == 0) b = b+1;
	prev_result = result;
    read = 1;
	if(count == 4'b1010) read = 0;
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
     multiply top(
         .clk (clk),
         .a (a),
         .b (b),
         .read (read),
         .result (result)
         );





endmodule
