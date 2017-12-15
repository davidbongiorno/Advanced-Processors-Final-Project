`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2017 10:31:06 PM
// Design Name: 
// Module Name: TwentySix_TwentyEight_Shifter
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


module TwentySix_TwentyEight_Shifter(input wire [25:0] sig_in, output wire [27:0] sig_out);

assign sig_out = {sig_in, 2'b00};

endmodule
