

module early_debnc(
input logic clk, rst,
input logic sw,
output logic db_early
    );
logic m_tic;
mod_m_cnt #(1000000) cntr(clk,rst,,m_tic);
typedef enum {zero,w0_1,w0_2,w0_3,one,w1_1,w1_2,w1_3}state;

state state_reg,state_next;

//[1] state register

always_ff@(posedge clk,posedge rst)
begin
if(rst)
state_reg <= zero;
else
state_reg<=state_next;
end

//next state logic

always_comb
begin
   case (state_reg)
   zero:
      if (sw)
       state_next = w0_1;
      else
       state_next = zero;
   w0_1:
      if (sw)
        state_next = w0_2;
      else 
         if(m_tic) 
           state_next = w0_1;
         else
           state_next = zero;
         
   w0_2:
     if (sw)
         
          state_next = w0_3;
        
     else 
       if(m_tic)
         state_next = w0_2;
       else
        state_next = zero;
         
   w0_3:
      if (sw)
        
         state_next = one;
        
      else 
        if(m_tic) 
          state_next = w0_3;
        else
          state_next = zero;
         
   one:
     if (~sw)
       state_next = w1_1;
     else 
       state_next = one;
         
   w1_1:
     if (~sw)
         state_next = w1_1;
        
         
      else 
        if(~m_tic) 
          state_next = w1_2;
        else
          state_next = w1_1;
         
   w1_2:
      if (~sw)
        
          state_next = w1_2;
       
      else 
       if(~m_tic) 
        state_next = w1_3;
       else
        state_next = w1_1;
   w1_3:
     if (~sw)
        
         state_next = w1_3;
        
      else 
      if(~m_tic) 
       state_next = zero;
      else
        
        state_next = w1_3;
    default: state_next = zero;
   endcase 
end  

//moore ourput

assign db_early=((state_reg == one)|| (state_reg == w0_1)|| (state_reg == w0_2)||(state_reg == w0_3) );


endmodule
