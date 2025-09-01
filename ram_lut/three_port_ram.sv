`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: IIT JAMMU
// Engineer: Mohammad Sikander Sheikh
// 
// Create Date: 01.09.2025 23:42:10
// Design Name: 
// Module Name: three_port_ram
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: it will infer 16 LUT form the fpga not BRAM
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module three_port_ram
#(parameter  A_WIDTH = 3, D_WIDTH = 8)
(
input logic clk, we,
input logic [A_WIDTH -1:0] w_add,
input logic [A_WIDTH -1:0] r0_add,
input logic [A_WIDTH -1:0] r1_add,
input logic [D_WIDTH -1:0] w_data,
output logic [D_WIDTH -1:0] r0_data,
output logic [D_WIDTH -1:0] r1_data
    );
    
  logic [D_WIDTH -1 :0] mem [0:2**A_WIDTH-1];
  
  always_ff@(posedge clk)
    begin
      if(we)
        mem[w_add] <= w_data;
    end
    assign r0_data=mem[r0_add];
    assign r1_data = mem[r1_add];  
  
endmodule
