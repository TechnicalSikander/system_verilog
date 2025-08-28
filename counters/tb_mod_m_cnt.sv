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


module tb_mod_m_cnt();
localparam M = 10;
localparam T = 20;
logic clk,rst;
logic [$clog2(M)-1:0] q;
logic max_tic;

mod_m_cnt #(.M(M))uut(.*);

always 
begin 
clk=1'b0;
#(T/2);
clk=1'b1;
#(T/2);
end

initial 
begin 
rst = 1'b1;
@(negedge clk);
rst = 1'b0;
end


endmodule
