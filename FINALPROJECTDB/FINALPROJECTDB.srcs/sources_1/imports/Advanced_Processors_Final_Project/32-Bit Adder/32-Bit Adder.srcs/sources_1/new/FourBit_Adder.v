`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/09/2017 04:52:57 PM
// Design Name: 
// Module Name: FourBit_Adder
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


module FourBit_Adder(output C4, output [3:0] Sum, input [3:0] a, b, input C0);
wire C1, C2, C3; // Intermediate Carries.

Full_Adder fa0 (.a(a[0]),  .b(b[0]),  .c_in(C0), .sum(Sum[0]),  .c_out(C1)),
           fa1 (.a(a[1]),  .b(b[1]),  .c_in(C1), .sum(Sum[1]),  .c_out(C2)),
           fa2 (.a(a[2]),  .b(b[2]),  .c_in(C2), .sum(Sum[2]),  .c_out(C3)),
           fa3 (.a(a[3]),  .b(b[3]),  .c_in(C3), .sum(Sum[3]),  .c_out(C4));

endmodule
