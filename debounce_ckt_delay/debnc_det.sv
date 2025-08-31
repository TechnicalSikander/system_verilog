`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: IIT JAMMU 
// Engineer: Mohammad Sikander Sheikh
// 
// Create Date: 31.08.2025 11:55:43
// Design Name: 
// Module Name: debnc_det
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


module debnc_det(
input logic clk, rst,
input logic sw,
output logic db
    );
logic m_tic;
mod_m_cnt #(1000000) cntr(clk,rst,,m_tic);
typedef enum {zero,w0_1,w0_2,w0_3,one,w1_1,w1_2,w1_3}state;

state state_reg,state_next;

//[1] state register

always_ff@(posedge clk,posedge rst)
begin
if(rst)
state_reg <= zero;
else
state_reg<=state_next;
end

//next state logic

always_comb
begin
   case (state_reg)
   zero:
      if (sw)
       state_next = w0_1;
      else
       state_next = zero;
   w0_1:
      if (sw)
        if(m_tic) 
         state_next = w0_2;
        else
         state_next = w0_1;
      else 
        state_next = zero;
         
   w0_2:
     if (sw)
        if(m_tic) 
          state_next = w0_3;
        else
          state_next = w0_2;
     else 
        state_next = zero;
         
   w0_3:
      if (sw)
        if(m_tic) 
         state_next = one;
        else
         state_next = w0_3;
      else 
        state_next = zero;
         
   one:
     if (~sw)
       state_next = w1_1;
     else 
       state_next = one;
         
   w1_1:
     if (~sw)
        if(~m_tic) 
         state_next = w1_1;
        else
         state_next = w1_2;
      else 
        state_next = one;
         
   w1_2:
      if (~sw)
        if(~m_tic) 
          state_next = w1_2;
        else
          state_next = w1_3;
      else 
        state_next = one;
   w1_3:
     if (~sw)
        if(~m_tic) 
         state_next = w1_3;
        else
         state_next = zero;
      else 
        state_next = one;
    default: state_next = one;
   endcase 
end  

//moore ourput

assign db=((state_reg == one)|| (state_reg == w1_1)|| (state_reg == w1_2)||(state_reg == w1_3) );


endmodule

module mod_m_cnt
       #(parameter M = 10)
(
       input logic clk,rst,
       output logic [$clog2(M)-1:0] q,
       output logic max_tic

    );
   // signals
   localparam N = $clog2(M);
   logic [N-1:0] r_next,r_reg;
   
   //[1]register segment
   always_ff@(posedge clk,posedge rst)
   begin 
       if(rst)
          r_reg <= 0;
       else
          r_reg <= r_next;
   end
   
 assign r_next =(max_tic)?0: r_reg+1;
  
  //[3] output logic segment
  
  assign q = r_reg; 
  assign max_tic=(r_reg==M - 1)?0:1; 
    
    
endmodule
