`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.08.2025 12:37:00
// Design Name: 
// Module Name: tb_debnc_det
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


module tb_debnc_det( );
logic clk,rst,sw,db;
localparam T = 20;
debnc_det uut(clk,rst,sw,db);
always 
begin
clk = 0;
#(T/2);
clk = 1;
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
sw=0;
 repeat(3) @(negedge clk);
 #20;
 sw = 1'b1;
 #20;
 sw = 1'b0;
  #20;
 sw = 1'b1;
  #20;
 sw = 1'b0;
  #20;
 sw = 1'b1;
 #2000;
 @(negedge clk)
 sw = 1'b0;
 
 repeat(4) @(negedge clk);
 sw = 1'b1;
 
 @(posedge clk);
 sw =1'b0;
 
 repeat (3) @(posedge clk);
 
 $finish;

end




endmodule
