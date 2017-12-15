`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/12/2017 11:10:41 PM
// Design Name: 
// Module Name: TOP_DATAPATH
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


module TOP_DATAPATH(input clk, reset);
    wire [31:0] next_PC; // absolute next pc (PC + 4) or branch or jump
    wire [31:0] current_PC;
    wire [31:0] current_instruction;
    wire [31:0] write_reg;
    wire [31:0] read_data_1,read_data_2; //REG FILE OPERANDS
    wire [31:0] read_data; // DATA_MEM OUTPUT
    wire [31:0] write_data; //REG_FILE INPUT & Result of mux
    wire [31:0] extended_address; // 32 bit sign extended offset
    wire [31:0] ALU_2nd_Operand; //RESULUT OF MUX
    wire [31:0] ALU_Result;
    wire [31:0] Incremented_PC; //PC + 4
    wire [27:0] Jump_Address_28; //low 28 bits of ja
    wire [31:0] Jump_Address;
    wire [31:0] shifted_extended_address; // shifted sign-extended offset
    wire [31:0] Branch_Address;
    wire [31:0] NEXT_PC_0; //possible next PC choice (Branch or PC +4)
    wire zero;
    //control wires
    wire RegDst, ALUSrc, MemtoReg,RegWrite,MemRead,MemWrite,Branch,Jump;
    wire [1:0] ALU_control;
    wire [2:0] selected_ALU_OP;
    wire Branch_sel;
    
    prog_count pc1(.address_in(next_PC), .reset(reset), .address_out(current_PC), .clk(clk));
    assign Incremented_PC = current_PC + 4;
    
    TwentySix_TwentyEight_Shifter ts_tes1(.sig_in(current_instruction[25:0]), .sig_out(Jump_Address_28));
    assign Jump_Address = {Incremented_PC[31:28],Jump_Address_28};
    
   Left_Shift ls1(.sig_in(extended_address), .sig_out(shifted_extended_address));

   and(Branch_sel, Branch, zero); 
   assign Branch_Address = Incremented_PC + shifted_extended_address;    
   
   ////// selcects between branch/normal pc increment    
   Two_One_MUX m4 (.a(Incremented_PC),.b(Branch_Address),.sel(Branch_sel), .out(NEXT_PC_0));
   ////// selcects between branch/normal pc increment  OR JUMP
   Two_One_MUX m5 (.a(NEXT_PC_0),.b(Jump_Address),.sel(Jump), .out(next_PC)); 
    
    
   InstructionMem im1(.clk(clk), .reset(reset), .current_address(current_PC), .instruction_out(current_instruction));
    
   Controller c1(.Opcode(current_instruction[31:26]), .RegDst(RegDst), .ALUSrc(ALUSrc),
                  .MemtoReg(MemtoReg), .RegWrite(RegWrite),.MemRead(MemRead), .MemWrite(MemWrite),
                  .Branch(Branch), .Jump(Jump), .ALU_control(ALU_control));
                  
    ///**** MIGHT HAVE TO WRITE 5 bit 2-1MUX*****
                
    //Two_One_MUX  m1 (.a(current_instruction[20:16]),.b(current_instruction[15:0]),.sel(RegDst), .out(write_reg));   
  
    assign write_reg  = (RegDst==1'b0) ? current_instruction[20:16] : current_instruction[15:11];
    //assign write_reg  = (RegDst==1'b0) ? current_instruction[20:16] : current_instruction[15:11];
    //assign z = a==b ? a : b==c ? b;
    
       Sign_Extension se1(.instruction(current_instruction[15:0]), .extended_address(extended_address));
      
     // ALU source mux              
     Two_One_MUX m2 (.a(read_data_2),.b(extended_address),.sel(ALUSrc), .out(ALU_2nd_Operand));                    
                       
                       
     ALU a1(.selected_ALU_OP(selected_ALU_OP), .a(read_data_1),.b(ALU_2nd_Operand), .result(ALU_Result), .zero(zero) );
     ALUController ac1(.ALUOp(ALU_control),.funct(current_instruction[5:0]), .selected_ALU_OP(selected_ALU_OP));
    
   //data mem/alu output mux              
        Two_One_MUX m3 (.a(ALU_Result),.b(read_data),.sel(MemtoReg), .out(write_data));  
               
                 
    Register_File rf1(.read_reg_1(current_instruction[25:21]), .read_reg_2(current_instruction[20:16]), .write_reg(write_reg), 
                      .write_data(write_data), .reset(reset), .clk(clk), .RegWrite(RegWrite),  .read_data_1(read_data_1), .read_data_2(read_data_2));
    
    Data_Mem dm1(.write_data(read_data_2),.address(ALU_Result),
                 .reset(reset), .clk(clk), .MemWrite(MemWrite), .MemRead(MemRead), .read_data(read_data));
     
endmodule
