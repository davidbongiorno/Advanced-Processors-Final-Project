`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/11/2017 06:49:55 PM
// Design Name: 
// Module Name: Register_FIle
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


module Register_File(input wire [4:0] read_reg_1, read_reg_2, write_reg, input wire [31:0] write_data, 
                     input reset, clk, RegWrite,  output wire [31:0] read_data_1, read_data_2);
        reg [31:0] REG_FILE [31:0];
        integer i;           
        assign read_data_1 = REG_FILE[read_reg_1];  
        assign read_data_2 = REG_FILE[read_reg_2]; 
        
        always@(posedge clk , posedge reset) begin 
            if(reset==1'b1)begin // Clear Registers if reset asserted
                for (i=0; i<32; i=i+1) begin
                    REG_FILE[i] = 32'h00000000;
                end
           end 
            if(RegWrite == 1'b1)begin
                REG_FILE[write_reg] = write_data;
            end
        end             
endmodule
