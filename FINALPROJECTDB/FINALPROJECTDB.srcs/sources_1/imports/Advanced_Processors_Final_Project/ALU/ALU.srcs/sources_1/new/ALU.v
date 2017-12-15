`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2017 06:33:05 PM
// Design Name: 
// Module Name: ALUController
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


module ALU(input wire [2:0] selected_ALU_OP, input wire signed [31:0] a,b, output wire signed [31:0] result, output wire zero);

 reg signed [31:0] y;
 assign result = y;
 assign zero = (result == 32'd0)? 1'b1: 1'b0;

always@(a,b,selected_ALU_OP) begin
    case(selected_ALU_OP)
        0: y = a + b; // put adder here
        1: y = a - b;
        2: y = a / b; // map divider here
        3: y = a * b; // map multiplier here
        4: y = a | b;
        5: y = a & b;
        6: y = a ^ b;
        7: y = (a < b)? 31'd1 : 31'd0; //Set if less than
    endcase

end
endmodule
