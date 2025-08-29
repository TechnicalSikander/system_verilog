`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: IIT JAMMU
// Engineer: Mohammad Sikander Sheikh
// 
// Create Date: 29.08.2025 07:36:17
// Design Name: Multisegment coding Style
// Module Name: mul_seg_cod
// Project Name: mul_seg_cod
// Target Devices: FPGA
// Tool Versions: 
// Description: to understand the multisegment coding style for FSM coding 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module two_stage_coding(
input logic clk,rst,
input logic a,b,
output logic y
    );
typedef enum {s0,s1,s2} state_type;   
//signal declaration
state_type state_reg,state_next;
  
//[1] state register

always_ff@(posedge clk,posedge rst)
begin
if(rst)
state_reg<=s0;
else
state_reg<=state_next;
end

//[2] next state logic

always_comb 
begin 
case(state_reg)
s0:
begin
y1=1'b1;
if(a)
  if(b)
   state_next = s2;
   y0 = 1'b1;
  else 
   state_next = s1;

end
s1:
  begin
    y1= 1'b1;
  if(a)
   state_next = s0;
  else
   state_next = s1;
  end
s2: 
  state_next = s0;
default state_next = s0;
endcase
end

//[3]mealy output
assign y0=(state_reg == s0)&a&b;
//[4]moore output
assign y1=(state_reg == s0)||(state_reg==s1);

endmodule
