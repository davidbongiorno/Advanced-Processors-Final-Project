`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/09/2017 04:29:53 PM
// Design Name: 
// Module Name: Full_Adder
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


module Full_Adder(input a, input b, input c_in, output sum, output c_out);
// Declare Intermidiate wires
wire c1, c2, s1;

Half_Adder M1(.a(a), .b(b), .sum(s1),  .c_out(c1));
Half_Adder M2(.a(s1), .b(c_in), .sum(sum),  .c_out(c2));

or(c_out,c1,c2);

endmodule
