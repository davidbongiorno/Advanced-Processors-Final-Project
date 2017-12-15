`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2017 06:11:46 PM
// Design Name: 
// Module Name: Left_Shift
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


module Left_Shift
(input [31:0] sig_in, output [31:0]  sig_out);

assign sig_out = sig_in << 2;

endmodule
