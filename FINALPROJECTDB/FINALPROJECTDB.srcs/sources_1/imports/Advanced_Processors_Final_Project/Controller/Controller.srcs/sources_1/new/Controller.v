`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2017 08:06:06 PM
// Design Name: 
// Module Name: Controller
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


module Controller(input wire [5:0] Opcode, output wire RegDst,output wire ALUSrc,
output wire MemtoReg, output wire RegWrite, output wire MemRead, output wire MemWrite,
output wire Branch,output wire Jump,  output wire [1:0] ALU_control);
 wire I_KEY;
reg RegDst_r,
ALUSrc_r,
MemtoReg_r,
RegWrite_r,
MemRead_r,
MemWrite_r,
Branch_r,
Jump_r,
I_KEY_r,
ALU_control_r;
assign RegDst = RegDst_r;
assign ALUSrc = ALUSrc_r;
assign MemtoReg = MemtoReg_r;
assign RegWrite = RegWrite_r;
assign MemRead = MemRead_r;
assign MemWrite = MemWrite_r;
assign Branch = Branch_r;
assign Jump = Jump_r;
assign ALU_control = ALU_control_r;
assign I_KEY = I_KEY_r;


always@(Opcode)begin
    case(Opcode)
    
    6'b000000:begin  // R-FORMAT
                 RegDst_r <= 1'b1; 
                 ALUSrc_r <= 1'b0; 
                 MemtoReg_r <= 1'b0; 
                 RegWrite_r <= 1'b1;  
                 MemRead_r <= 1'b0; 
                 MemWrite_r <= 1'b0; 
                 Branch_r <= 1'b0; 
                 Jump_r <= 1'b0;
                 ALU_control_r <= 2'b10;  
               //  I_KEY_r <= 1'b0;
              end       
    
   6'b001000:begin  // I - type for ADDI
                 RegDst_r <= 1'b0;
                 ALUSrc_r <= 1'b1; 
                 MemtoReg_r <= 1'b0; 
                 RegWrite_r <= 1'b1;  
                 MemRead_r <= 1'b0; 
                 MemWrite_r <= 1'b0; 
                 Branch_r <= 1'b0; 
                 Jump_r <= 1'b0; 
                 ALU_control_r <= 2'b10;  
                // I_KEY_r <= 1'b1;
              end       
       
    6'b100011:begin  // lw
                 RegDst_r <= 1'b0; 
                 ALUSrc_r <= 1'b1; 
                 MemtoReg_r <= 1'b1; 
                 RegWrite_r <= 1'b1;  
                 MemRead_r <= 1'b1; 
                 MemWrite_r <= 1'b0; 
                 Branch_r <= 1'b0;
                 Jump_r <= 1'b0; 
              //   I_KEY_r <= 1'b0;
                 ALU_control_r <= 2'b00;  
              end    
    6'b101011:begin  // sw
                 RegDst_r <= 1'bx; 
                 ALUSrc_r <= 1'b1; 
                 MemtoReg_r <= 1'bx; 
                 RegWrite_r <= 1'b0;  
                 MemRead_r <= 1'b0; 
                 MemWrite_r <= 1'b1; 
                 Branch_r <= 1'b0; 
                 Jump_r <= 1'b0; 
                 ALU_control_r <= 2'b00;  
              end          
    6'b000100:begin  // beq
                RegDst_r <= 1'bx; 
                ALUSrc_r <= 1'b0; 
                MemtoReg_r <= 1'bx;
                RegWrite_r <= 1'b0;  
                MemRead_r <= 1'b0;
                MemWrite_r <= 1'b0; 
                Branch_r <= 1'b1; 
                Jump_r <= 1'b0;
                ALU_control_r <= 2'b01;  
              end  
              
     6'b000010:begin  // jump
             RegDst_r <= 1'bx; 
             ALUSrc_r <= 1'bx; 
             MemtoReg_r <= 1'bx; 
             RegWrite_r <= 1'bx;  
             MemRead_r <= 1'bx; 
             MemWrite_r <= 1'bx; 
             Branch_r <= 1'bx ;
             Jump_r <= 1'b1; 
             ALU_control_r <= 2'bxx;  
           end                    
    endcase
end

endmodule
