`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/13/2017 01:07:46 PM
// Design Name: 
// Module Name: TOP_DATAPATH_tb
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


module TOP_DATAPATH_tb;
///INPUTS
reg clk, reset;

TOP_DATAPATH uut(.clk(clk), .reset(reset));

initial begin
       
          clk = 0;  
          forever #10 clk = ~clk;  
     end  
     initial begin  
          // Initialize Inputs  
          //$monitor ("register 3=%d, register 4=%d", reg3,reg4);  
          reset = 1;  
          // Wait 100 ns for global reset to finish  
          #100;  
    reset = 0;  
          // Add stimulus here  
     end  


endmodule
