//////////////////////////////////////////////////////////////////////////////////
// Exercise #9
// Student Name:Devang Sehgal
// Date: 12 June 2020
//
//  Description: In this exercise, you need to design a module that lights leds
//  at different frequencies
//
//  inputs:
//           rst_n, clk_n, clk_p, button
//
//  outputs:
//           led_0, led_1, led_2
//////////////////////////////////////////////////////////////////////////////////


module top(
    input clk_p,
    input clk_n,
     //Todo: add all other ports besides clk_n and clk_p
     input rst_n,
     input button,
     output led_0,
     output led_1,
     output led_2
   );


   /* clock infrastructure, do not modify */
    wire clk_ibufds;

    IBUFDS IBUFDS_sysclk (
	.I(clk_p),
	.IB(clk_n),
	.O(clk_ibufds)
);

     wire clk; //use this signal as a clock for your design

     BUFG bufg_clk (
	.I  (clk_ibufds),
	.O  (clk)
      );

     reg led_0;
     reg led_1;
     reg led_2;

     reg [19:0] counter_0;
     reg [20:0] counter_1;
     reg [21:0] counter_2;

     //Add logic here

     //idea: we want to signals of 50 hz and less. we use counters which increment
     //with posedge. then they change at 50MHz. Having an led change once in 2^20 configurations
     //of the counter means that its frequency is 100 Mhz/(2^21) = 47.7Hz. the other is
     //half of this, so 23.8Hz, then half of that so 11.9Hz
     always @ (posedge clk) begin
        counter_0 <= (counter_0 + 1);
        counter_1 <= (counter_1 + 1);
        counter_2 <= (counter_2 + 1);
        //if reset is 0, all led's go to 0;
        if(!rst_n) begin
            led_0 <= 0;
            led_1 <= 0;
            led_2 <= 0;
            counter_0 <= 0;
            counter_1 <= 0;
            counter_2 <= 0;
        end
        else begin
            if(button) begin
                led_0 <= 0;
                led_1 <= 0;
                led_2 <= 0;
            end
            else begin
                if(counter_0 == 20'd1)
                    led_0 <= ~led_0;
                if(counter_1 == 21'd1)
                    led_1 <= ~led_1;
                if(counter_2 == 22'd1)
                    led_2 <= ~led_2;
            end
        end
    end





endmodule
