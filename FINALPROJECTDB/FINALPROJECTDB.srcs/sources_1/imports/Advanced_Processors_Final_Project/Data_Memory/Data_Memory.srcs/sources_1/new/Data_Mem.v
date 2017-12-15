`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/12/2017 05:23:41 PM
// Design Name: 
// Module Name: Data_Mem
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


module Data_Mem(input wire [31:0] write_data, input wire [31:0] address, 
               input reset, clk, MemWrite, MemRead, output wire [31:0] read_data);
               
        reg [31:0] DATA_MEM [55:0];
        integer i;  
        reg [31:0] selected_mem_read;
        assign read_data = selected_mem_read;
        
        always@(posedge clk, reset, MemWrite, MemRead)begin
         if(MemWrite == 1'b1)begin
                    DATA_MEM[address] = write_data;
                   end 
          else if(MemRead == 1'b1)begin
                 selected_mem_read = DATA_MEM[address];
           end             
                   
           else if(reset ==1'b1)begin
              for(i =0; i<256;i = i+1)
               DATA_MEM[i] = 32'h00000000;
             end                
           end    
endmodule