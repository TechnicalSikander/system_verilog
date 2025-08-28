`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: IIT JAMMU   
// Engineer: Mohammad Sikander Sheikh
// 
// Create Date: 27.08.2025 15:39:14
// Design Name: binary Counter
// Module Name: bin_cnt
// Project Name: bin_cnt
// Target Devices: 
// Tool Versions: 
// Description: count till F 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_bin_cnt();
localparam N = 4;
localparam T = 20;
logic clk,rst;
logic [N-1:0] q;
logic max_tic;

bin_cnt #(.N(N))uut(.*);

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
