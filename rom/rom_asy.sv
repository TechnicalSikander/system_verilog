`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: IIT JAMMU
// Engineer: Mohammad Sikander Sheikh
// 
// Create Date: 03.09.2025 09:22:01
// Design Name: 
// Module Name: rom_asy
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


module rom_asy(
input logic [2:0] addr,
output logic [1:0] data
    );
    
logic [1:0]rom[7:0];
initial 
$readmemb("truth_table.mem",rom);

assign data = rom[addr];
endmodule
