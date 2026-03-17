`timescale 1ns / 1ps
//4 registers 00 = R0, 01 = R1, 10 = R2, 11 = R3

module regfile(
    input clk, 
    input we, //write enable
    input [1:0] w_addr,  //w_addr is used to choose which one of the 4 registers gets written.
    input [7:0] w_data, //value to write
    //r_addr1 and r_addr2 are used to choose which registers to read from. The values read will be output on r_data1 and r_data2 respectively.
    //This is due to needing two inputs for the ALU.
    input [1:0] r_addr1, 
    input [1:0] r_addr2, 
    output [7:0] r_data1,//value read from register 1
    output [7:0] r_data2 //value read from register 2
    ); 

    //delcares a register named regs that is an array of 4 elements each 8 bits wide
    reg [7:0] regs [3:0];

    // synchronous write 0 = dont write
    always @(posedge clk) begin
        if (we)
            regs[w_addr] <= w_data;
    end

    // combinational reads
    //whatever value is in the selected register, send it to r_data1 and r_data2
    assign r_data1 = regs[r_addr1];
    assign r_data2 = regs[r_addr2];

endmodule
