
`timescale 1ns / 100ps

module dice(
    //Todo: add ports
    input rst,
    input clk,
    input button,
    output [2:0] throw
    );

    //Todo: add registers and wires, if needed
    reg [2:0] throw;

    //Todo: add user logic
    always @ (posedge clk) begin
    if(rst)
        throw <= 3'b001;
    else
        case (throw)
            3'b000: throw <= (button)?3'b001:3'b001;
            3'b001: throw <= (button)?3'b010:3'b001;
            3'b010: throw <= (button)?3'b011:3'b010;
            3'b011: throw <= (button)?3'b100:3'b011;
            3'b100: throw <= (button)?3'b101:3'b100;
            3'b101: throw <= (button)?3'b110:3'b101;
            3'b110: throw <= (button)?3'b001:3'b110;
            3'b111: throw <= (button)?3'b001:3'b001;
            default: throw <= 3'b0;
        endcase
    end


    endmodule
