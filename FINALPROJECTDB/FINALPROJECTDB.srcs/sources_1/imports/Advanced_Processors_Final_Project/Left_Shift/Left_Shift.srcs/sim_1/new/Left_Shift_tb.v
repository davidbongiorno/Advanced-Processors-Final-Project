`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2017 07:32:26 PM
// Design Name: 
// Module Name: Left_Shift_tb
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


module Left_Shift_tb;
/// INPUTS
reg [31:0] sig_in;
///OUTPUTS
wire [31:0] sig_out;
    
Left_Shift uut(.sig_in(sig_in), .sig_out(sig_out));
 initial 
 begin
    $monitor($time," sig_out=%b,sig_in=%b",sig_out,sig_in);
       sig_in = 32'b00000000000000000000000000000011; 
    #1 sig_in = 32'b00000000000000000000000011001100; 
    #1 sig_in = 32'd24;
    #1 sig_in = 32'd100;
    #10 
    $finish;
end 
endmodule

