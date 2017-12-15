`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2017 09:12:59 PM
// Design Name: 
// Module Name: prog_count
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


module prog_count(input wire [31:0] address_in, input wire reset, output reg [31:0] address_out, input clk);

    always@ (posedge clk, posedge reset) begin
    address_out = reset? 0 : address_in;  
    end
endmodule
