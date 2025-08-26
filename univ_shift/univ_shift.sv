`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Technical Sikander  
// Engineer: Mohammad Sikander Sheikh  
// 
// Create Date: 26.08.2025 06:30:15
// Design Name: Universal Shift Register
// Module Name: univ_shift
// Project Name: univ_shift  
// Target Devices: 
// Tool Versions: 
// Description: it will use to shift left or right or parallal input parallal output data available
// 
// Dependencies: 
// N = 8
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module univ_shift
       #(parameter N = 8)
(
       input logic clk,rst,
       input logic [1:0] ctrl,
       input logic [N-1:0]d,
       output logic [N-1:0] q

    );
   // signals 
   logic [N-1:0] r_next,r_reg;
   
   //[1]register segment
   always_ff@(posedge clk,posedge rst)
   begin 
       if(rst)
          r_reg <= 0;
       else
          r_reg <= r_next;
   end
   
  //[2] multiplexer
  always_comb
  begin
      case(ctrl)
      2'b00: r_next = r_reg;
      2'b01: r_next ={r_reg[N-2:0],d[0]}; //left shift
      2'b10: r_next ={d[N-1],r_reg[N-1:1]};//right shift
      2'b11: r_next = d;
      default: r_next = r_reg;
      endcase
  end
  
  //[3] output logic segment
  
  assign q = r_reg; 
   
    
    
endmodule
