`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/09/2017 05:17:11 PM
// Design Name: 
// Module Name: SixteenBit_Adder
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


module SixteenBit_Adder(input [15:0] a,b, input cin, output [15:0] sum, output cout);

wire c1,c2,c3;
FourBit_Adder fba1 (.a(a[3:0]),   .b(b[3:0]),   .C0(cin),.Sum(sum[3:0]), .C4(c1));
FourBit_Adder fba2 (.a(a[7:4]),   .b(b[7:4]),   .C0(c1), .Sum(sum[7:4]), .C4(c2));
FourBit_Adder fba3 (.a(a[11:8]),  .b(b[11:8]),  .C0(c2), .Sum(sum[11:8]), .C4(c3));
FourBit_Adder fba4 (.a(a[15:12]), .b(b[15:12]), .C0(c3), .Sum(sum[15:12]), .C4(cout));
endmodule

