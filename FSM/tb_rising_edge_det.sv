`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.08.2025 08:35:51
// Design Name: 
// Module Name: tb_rising_edge_det
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: it test both mealy and moore rising edge detector 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_rising_edge_det();
localparam T=10;
logic clk, rst,level,tick_mealy,tick_moore;

//mealy 
rising_edge_det_mealy uut1( clk,rst,level,tick_mealy );

rising_edge_det uut2( clk,rst,level,tick_moore );

always
begin
clk =1'b0;
#(T/2);
clk = 1'b1;
#(T/2);
end

initial 
begin 
rst = 1;
#(T/2);
rst =0;
end

initial 
begin
 repeat(3) @(negedge clk);
 #2;
 level = 1'b1;
 @(negedge clk)
 level = 1'b0;
 
 repeat(4) @(negedge clk);
 level = 1'b1;
 
 @(posedge clk);
 level =1'b0;
 
 repeat (3) @(posedge clk);
 
 $finish;

end


endmodule
