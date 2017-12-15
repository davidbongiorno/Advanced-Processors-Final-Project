`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/30/2017 01:11:51 AM
// Design Name: 
// Module Name: Two_One_MUX
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


module Two_One_MUX(input  [31:0]a,b,input sel, output wire [31:0] out);

assign out = (sel==1'b0) ? a : b;

endmodule
