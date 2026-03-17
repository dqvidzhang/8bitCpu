`timescale 1ns / 1ps
module alu(
    input wire [7:0] a, //first input
    input wire [7:0] b, //2nd inptut
    input wire [2:0] alu_op, //decides what to use
    output reg [7:0] result, //output of the operation
    output wire zero //indicates if the result is zero
    );

always @(*) begin
    case (alu_op)
       2'b00: result = a + b; //add
       2'b01: result = a - b; //subtract
       2'b10: result = b; //stores value of b in result
       default: result = 8'b00000000; //default case
    endcase
end

assign zero = (result == 8'b00000000); //zero flag is set if result is zero

endmodule
