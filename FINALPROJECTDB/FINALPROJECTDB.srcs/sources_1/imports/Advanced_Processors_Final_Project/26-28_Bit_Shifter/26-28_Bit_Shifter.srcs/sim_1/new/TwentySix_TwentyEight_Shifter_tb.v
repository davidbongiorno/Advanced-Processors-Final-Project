`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2017 10:41:53 PM
// Design Name: 
// Module Name: TwentySix_TwentyEight_Shifter_tb
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


module TwentySix_TwentyEight_Shifter_tb;
//INPUT
reg [25:0] sig_in;
//OUTPUT
wire [27:0] sig_out;
TwentySix_TwentyEight_Shifter uut(.sig_in(sig_in), .sig_out(sig_out));

initial 
begin 
    $monitor($time,"sig_out = %b, sig_in = %b", sig_out, sig_in);
       sig_in = 26'b00000000000000000000001010;
    #1 sig_in = 26'b00000000000000000000111111;
    #1 sig_in = 26'b00000000000000000110011001;
    #1 sig_in = 26'b11111111111111111111111111;
    #10
    $finish;
end
endmodule
