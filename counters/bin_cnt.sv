

module bin_cnt
       #(parameter N = 8)
(
       input logic clk,rst,
       output logic [N-1:0] q,
       output logic max_tic

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
  //[2] increasing till max_tic
 assign r_next =(max_tic)?0: r_reg+1;
  
  //[3] output logic segment
  
  assign q = r_reg; 
  assign max_tic=(r_reg==2**N - 1)?0:1; 
    
    
endmodule
