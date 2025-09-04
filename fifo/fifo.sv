

module fifo
#(parameter ADD_WIDTH=3,DATA_WIDTH=8)
(
input logic clk,rst,
input logic w_en,r_en,
input logic [DATA_WIDTH-1:0]w_data,
output logic [DATA_WIDTH-1:0]r_data,
output logic full,empty
    );
logic [ADD_WIDTH-1:0]w_add,r_add;


reg_file #(.ADD_WIDTH(ADD_WIDTH),.DATA_WIDTH(DATA_WIDTH))r_file(.w_en(w_en & ~full),.*);

cntrl #(.ADD_WIDTH(ADD_WIDTH))cntrl_unit(.*);
  
endmodule
