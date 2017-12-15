`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/30/2017 01:28:49 AM
// Design Name: 
// Module Name: Two_One_MUX_tb
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


module Two_One_MUX_tb;
 //---INPUTS----
 reg [31:0] a;
 reg [31:0] b;
 reg       sel;
 //---OUTPUTS----
wire [31:0] out;
Two_One_MUX uut(.a(a), .b(b), .sel(sel), .out(out));

initial 
begin
     $monitor($time," out=%b,sel=%b,a=%b,b=%b",out,sel,a,b);
     sel = 1'b0; a = 32'hFFFFFFFF; b = 32'hAAAAAAAA;
    #1 sel = 1'b1;
    #10 
    $finish;
end 
endmodule

