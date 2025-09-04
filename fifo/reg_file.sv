`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.09.2025 07:01:46
// Design Name: 
// Module Name: reg_file
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


module reg_file
#(parameter ADD_WIDTH=3,DATA_WIDTH=8)
(
input logic clk,
input logic w_en,
input logic [ADD_WIDTH-1:0] w_add,
input logic [DATA_WIDTH-1:0]w_data,
input logic [ADD_WIDTH-1:0]r_add,
output logic [DATA_WIDTH-1:0]r_data
    );
   //signal declaration
   logic [DATA_WIDTH-1:0]mem[0:2**ADD_WIDTH -1];
   //write operation
   always_ff@(posedge clk)
   begin
   if(w_en)
   mem[w_add]<=w_data;
   end
   
   //read operation
   assign r_data = mem[r_add];
   
   
endmodule
