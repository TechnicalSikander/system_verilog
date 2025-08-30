`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: IIT JAMMU
// Engineer: Mohammad Sikander Sheikh
// 
// Create Date: 29.08.2025 07:36:17
// Design Name:Mealy FSM coding Style rising edge detector
// Module Name: mul_seg_cod
// Project Name: mul_seg_cod
// Target Devices: FPGA
// Tool Versions: 
// Description: to understand the rising edge detector for mealy FSM coding 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module rising_edge_det_mealy(
input logic clk,rst,
input logic level,
output logic tick
    );
typedef enum {zero,one} state_type;   
//signal declaration
state_type state_reg,state_next;
  
//[1] state register

always_ff@(posedge clk,posedge rst)
begin
if(rst)
state_reg <= zero;
else
state_reg<=state_next;
end

//[2] next state logic

always_comb 
begin 
tick = 0;
case(state_reg)
zero:
if(level)
  begin tick = 1;
  state_next = one; end
else 
   state_next = zero;
one: 
 if(level)
   state_next = one;
  else
   state_next = zero;
default state_next = zero;
endcase
end


endmodule

