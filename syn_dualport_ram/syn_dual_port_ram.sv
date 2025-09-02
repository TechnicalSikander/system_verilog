module syn_dual_port_ram
#(parameter  A_WIDTH = 3, D_WIDTH = 8)
(
input logic clk, we_a,we_b,
input logic [A_WIDTH -1:0] add_a,
input logic [A_WIDTH -1:0] add_b,
input logic [D_WIDTH -1:0] din_a,din_b,
output logic [D_WIDTH -1:0] dout_a,
output logic [D_WIDTH -1:0] dout_b
    );
    
  logic [D_WIDTH -1 :0] mem [0:2**A_WIDTH-1];
  
  always_ff@(posedge clk)
    begin
      if(we_a)
        mem[add_a] <= din_a;
        
     dout_a <= mem[add_a]; 
    end
   
   always_ff@(posedge clk)
    begin
      if(we_b)
        mem[add_b] <= din_b;
        
     dout_b <= mem[add_b]; 
    end
   
  
endmodule
