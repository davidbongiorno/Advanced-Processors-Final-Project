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


module ALUController(input wire [1:0] ALUOp, input wire [5:0] funct, output wire [2:0] selected_ALU_OP);

reg [2:0] ALU_control;
assign selected_ALU_OP = ALU_control;

always@(ALUOp,funct) begin
    case(ALUOp) // Determines Instruction Type
    2'b00: ALU_control <= 3'b000;          // <-lw or sw (alu function is add)
    2'b01: ALU_control <= 3'b001;          //beq (alu function is subtract)
    2'b10:                                // R-Type -> must specify
        case(funct)
        6'b100000: ALU_control <= 3'b000; // (alu function is add)
        6'b100010: ALU_control <= 3'b001; // (alu function is subtract)
        6'b011010: ALU_control <= 3'b010; // (alu function is division)
        6'b011000: ALU_control <= 3'b011; // (alu function is multiplication)
        6'b100101: ALU_control <= 3'b100; // (alu function is OR)
        6'b100100: ALU_control <= 3'b101; // (alu function is AND)
        6'b100110: ALU_control <= 3'b110; // (alu function is XOR)s
        6'b101010: ALU_control <= 3'b111; // (alu function is SET LESS THAN)
        default: ALU_control <= 3'b000;
        endcase
     default: ALU_control <= 3'b000;
    endcase
end 

endmodule
