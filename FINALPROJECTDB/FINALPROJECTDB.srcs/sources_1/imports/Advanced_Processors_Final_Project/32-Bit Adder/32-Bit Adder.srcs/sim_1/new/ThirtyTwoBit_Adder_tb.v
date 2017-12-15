`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2017 01:06:14 AM
// Design Name: 
// Module Name: ThirtyTwoBit_Adder_tb
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


module ThirtyTwoBit_Adder_tb;
// Inputs:
reg [31:0] a;
reg [31:0] b;
reg c_in;

// Outputs:
wire [31:0] sum;
wire c_out;

ThirtyTwoBit_Adder uut(.a(a),.b(b), .sum(sum), .CIN(c_in), .COUT(c_out));
initial
begin 
    $monitor($time,"sum = %b,c_out= %b,a= %b,b= %b,c_in= %b",sum,c_out,a,b,c_in);
        c_in = 1'b0; a = 32'd0; b = 32'd10;
    #1  c_in = 1'b0; a = 32'd10; b = 32'd10;
    #1  c_in = 1'b0; a = 32'd100; b = 32'd100;
    #1  c_in = 1'b0; a = 32'hFFFFFFFF; b = 32'h00000000;
    #1  c_in = 1'b0; a = 32'hFFFFFFFF; b = 32'hFFFFFFFF;
    #1  c_in = 1'b0; a = 32'hABCDEF0A; b = 32'hA0FEDCBA;
    #1  c_in = 1'b1; a = 32'd0; b = 32'd10;
    #1  c_in = 1'b1; a = 32'd10; b = 32'd10;
    #1  c_in = 1'b1; a = 32'd100; b = 32'd100;
    #1  c_in = 1'b1; a = 32'hFFFFFFFF; b = 32'h00000000;
    #1  c_in = 1'b1; a = 32'hFFFFFFFF; b = 32'hFFFFFFFF;
    #1  c_in = 1'b1; a = 32'hABCDEF0A; b = 32'hA0FEDCBA;
    #2
    $finish;
end
endmodule
