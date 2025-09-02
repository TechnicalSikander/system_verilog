module three_port_ram_syn_rd
#(parameter  A_WIDTH = 3, D_WIDTH = 8)
(
input logic clk, we,
input logic [A_WIDTH -1:0] w_add,
input logic [A_WIDTH -1:0] r0_add,
input logic [A_WIDTH -1:0] r1_add,
input logic [D_WIDTH -1:0] w_data,
output logic [D_WIDTH -1:0] r0_data,
output logic [D_WIDTH -1:0] r1_data
    );
    
  logic [D_WIDTH -1 :0] mem [0:2**A_WIDTH-1];
  
  always_ff@(posedge clk)
    begin
      if(we)
        mem[w_add] <= w_data;
        
     r1_data <= mem[r1_add]; 
    end
    assign r0_data=mem[r0_add];
   
  
endmodule
