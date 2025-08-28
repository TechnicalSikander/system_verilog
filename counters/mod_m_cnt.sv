`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: IIT JAMMU   
// Engineer: Mohammad Sikander Sheikh
// 
// Create Date: 27.08.2025 15:39:14
// Design Name: Mod M Counter
// Module Name: bin_cnt
// Project Name: mod_m_cnt
// Target Devices: 
// Tool Versions: 
// Description: count till M-1 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////



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

