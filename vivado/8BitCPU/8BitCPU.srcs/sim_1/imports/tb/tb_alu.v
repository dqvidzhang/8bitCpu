`timescale 1ns / 1ps

module tb_alu;
    //what inputs / outputs the test bench will use
    reg  [7:0] a;
    reg  [7:0] b;
    reg  [1:0] alu_op;
    wire [7:0] result;
    wire       zero;

    //these are the signals that will recorded
    alu uut (
        .a(a),
        .b(b),
        .alu_op(alu_op),
        .result(result),
        .zero(zero)
    );

    //basic cases
    initial begin
        // Test ADD: 3 + 5 = 8
        a = 8'd3;
        b = 8'd5;
        alu_op = 2'b00;
        #10;

        // Test SUB: 9 - 4 = 5
        a = 8'd9;
        b = 8'd4;
        alu_op = 2'b01;
        #10;

        // Test zero flag: 7 - 7 = 0
        a = 8'd7;
        b = 8'd7;
        alu_op = 2'b01;
        #10;

        // Test pass-through B
        a = 8'd0;
        b = 8'd12;
        alu_op = 2'b10;
        #10;

        $stop;
    end

endmodule