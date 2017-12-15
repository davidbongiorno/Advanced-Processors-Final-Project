`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/30/2017 12:21:50 AM
// Design Name: 
// Module Name: ThirtyTwoBit_Adder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ThirtyTwoBit_Adder(input[31:0] a,b, output [31:0] sum, input CIN, output COUT);
wire c1;
SixteenBit_Adder sba1(.a(a[15:0]),.b(b[15:0]),  .cin(CIN), .sum(sum[15:0]),  .cout(c1));
SixteenBit_Adder sba2(.a(a[31:16]),.b(b[31:16]),  .cin(c1),  .sum(sum[31:16]), .cout(COUT));

endmodule
