`timescale 1ns / 1ps

module tb_regfile;

    reg clk;
    reg we;
    reg [1:0] w_addr;
    reg [7:0] w_data;
    reg [1:0] r_addr1;
    reg [1:0] r_addr2;

    wire [7:0] r_data1;
    wire [7:0] r_data2;

    // Unit Under Test
    regfile uut (
        .clk(clk),
        .we(we),
        .w_addr(w_addr),
        .w_data(w_data),
        .r_addr1(r_addr1),
        .r_addr2(r_addr2),
        .r_data1(r_data1),
        .r_data2(r_data2)
    );

    // clock: 10 ns period
    always #5 clk = ~clk;

    initial begin
        // start values
        clk = 0;
        we = 0;
        w_addr = 2'b00;
        w_data = 8'd0;
        r_addr1 = 2'b00;
        r_addr2 = 2'b00;

        // write 5 into R1
        #10;
        we = 1;
        w_addr = 2'b01;
        w_data = 8'd5;
        #10;

        // stop writing, read R1
        we = 0;
        r_addr1 = 2'b01;
        r_addr2 = 2'b00;
        #10;

        // write 12 into R2
        we = 1;
        w_addr = 2'b10;
        w_data = 8'd12;
        #10;

        // stop writing, read R1 and R2
        we = 0;
        r_addr1 = 2'b01;
        r_addr2 = 2'b10;
        #10;

        // try to write 99 into R3 with we = 0
        // this should NOT change R3
        w_addr = 2'b11;
        w_data = 8'd99;
        we = 0;
        r_addr1 = 2'b11;
        r_addr2 = 2'b10;
        #10;

        $stop;
    end

endmodule