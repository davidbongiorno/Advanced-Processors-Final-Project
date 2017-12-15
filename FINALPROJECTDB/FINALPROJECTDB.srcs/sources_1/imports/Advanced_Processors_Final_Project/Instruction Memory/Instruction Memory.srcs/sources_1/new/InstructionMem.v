`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/11/2017 02:38:29 PM
// Design Name: 
// Module Name: InstructionMem
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


module InstructionMem(input clk, reset, input wire [31:0] current_address, output wire [31:0] instruction_out);
reg [31:0] IMEM [127:0];
reg [31:0] current_instruction;
assign instruction_out = current_instruction;

always@(posedge clk, current_address, posedge reset) begin
    current_instruction <= IMEM[current_address]; 
    
    if(reset == 1'b1) begin
        current_instruction <= IMEM[0];
    end
  
   IMEM[0] = 32'h2008FFF6;  // addi t0, zero,-10  (0xFFFFFFF6)   // i = -10 CASE I
 //IMEM[0] = 32'h0x20080014 // addi t0 , zero, 20 (0x0000024)   // i = 20   CASE II
   IMEM[4] = 32'hAC080004;  // sw t0 0x0004 zero  (location 4)   // store i in data memory location 4 
   IMEM[8] = 32'h2009000A;  // addi t1 zero 10    (0x0000000A)   // j = 10
   IMEM[12] = 32'hAC090008; // sw t1 0x0008 zero  (location 8)   // store k in data memory location 8
   IMEM[16] = 32'h200A0096; // addi t2 zero 150   (0x00000096)   // a = 150
   IMEM[20] = 32'hAC0A0014; // sw t2 0x0014 zero  (location 20)  // store a in data memory location 20
   IMEM[24] = 32'h200B00C8; // addi t3 zero 200   (0x000000C8)   // b = 200
   IMEM[28] = 32'hAC0B0018; // sw t3 0x0018 zero  (location 24)  // store b in data memory location 24
   IMEM[32] = 32'h200C012C; // addi t4 zero 300   (0x0000012C)   // c = 300
   IMEM[36] = 32'hAC0C001C; // sw t4 0x001c zero  (location 28)  // store c in data memory location 28
   IMEM[40] = 32'h200D01C2; // addi t5 zero 450   (0x000001C2)   // d = 450
   IMEM[44] = 32'hAC0D0020; // sw t5 0x0020 zero  (location 32)  // store d in data memory location 32
   IMEM[48] = 32'h20100001; // ADDI S0, zero, 1   CREATE VALUE FOR BEQ = 1 (BNE = 0) FOR BRANCH
   IMEM[52] = 32'h0128702A; // slt t6 t1 t0       (PART I of BRANCH CONDITION (BGT) )***
   IMEM[56] = 32'h11C00005; // beq t6 s0 0x0005   (PART II of BRANCH CONDITION (BGT))*** -> if satisfied jump to PC = 80
   IMEM[60] = 32'h01AC6818; // "add" t5 t5 t4     (MULTIPLY COMMAND WRITTEN AS AN R-TYPE) // (c * d)
   IMEM[64] = 32'h014B7822; // sub t7 t2 t3       (a - b)
   IMEM[68] = 32'h01ED7820; // add t7 t7 t5       result = (a-b) + (c*d)
   IMEM[72] = 32'hAC0F0024; // sw t7 0x0024 zero  store result in memory (location 36)!!!!
   IMEM[76] = 32'h08000018; // j 0x0018           jump to finish! (PC = 92)
   IMEM[80] = 32'h00000000;
   IMEM[84] = 32'h016D5820; // If BRANCH add t3 t3 t5        (b + d)
   IMEM[88] = 32'h016A781A; //  DIVIDE"add" t7 t3 t2      (DIVIDE COMMAND WRITTEN AS AN R-TYPE) // (b + d ) / a
   IMEM[92] = 32'hAC0F0028; // sw t7 0x0028 zero  store result in memory (location 40)!!!!
   IMEM[94] = 32'h00000000;
end


endmodule
