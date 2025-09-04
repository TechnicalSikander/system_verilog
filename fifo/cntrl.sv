`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.09.2025 07:03:09
// Design Name: 
// Module Name: cntrl
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


module cntrl
#(parameter ADD_WIDTH = 3)
(
input logic clk,w_en,r_en,rst,
output logic full, empty,
output logic [ADD_WIDTH-1:0] w_add,
output logic [ADD_WIDTH-1:0] r_add
    );
    logic [ADD_WIDTH-1:0] w_ptr,w_ptr_nxt,r_ptr,r_ptr_nxt;
    logic full_nxt;
    logic empty_nxt;
    
    always_ff@(posedge clk,posedge rst)
    begin
    if(rst) 
    begin
      w_ptr<=0;
      r_ptr<=0;
      full<=1'b0;
      empty<=1'b1;
    end
    else
    begin
       w_ptr<=w_ptr_nxt;
       r_ptr<=r_ptr_nxt;
       full<=full_nxt;
       empty<=empty_nxt;
    end
    end
 always_comb
 begin
 w_ptr_nxt =w_ptr;
 r_ptr_nxt = r_ptr;
 full_nxt =full;
 empty_nxt =empty;
 
 case({w_en,r_en})
 2'b01://read
 begin
     if(~empty)
       begin
       r_ptr_nxt=r_ptr+1;
       full_nxt=1'b0;
       if(r_ptr_nxt==w_ptr)
          empty_nxt=1'b1;
      
       else
           empty_nxt=1'b0;
        end

 end
  2'b10://write
 begin
 if(~full)
    begin
    w_ptr_nxt = w_ptr+1;
    empty_nxt = 1'b0;
    if(w_ptr_nxt==r_ptr)
       full_nxt= 1'b1;
     end
 end
  2'b11://read and write
    begin
      if(empty)
      begin
        w_ptr_nxt =w_ptr;
        r_ptr_nxt=r_ptr;
      end
      else
      begin
        w_ptr_nxt =w_ptr+1;
        r_ptr_nxt=r_ptr+1;
      end
 end
 
 default: ;//case00
 
 endcase
 
end
assign w_add =w_ptr;
assign r_add = r_ptr;
endmodule




//module cntrl
//#(parameter ADD_WIDTH = 3)
//(
//input logic clk,w_en,r_en,rst,
//output logic full, empty,
//output logic [ADD_WIDTH-1:0] w_add,
//output logic [ADD_WIDTH-1:0] r_add
//    );
//    logic [ADD_WIDTH-1:0] w_ptr,w_ptr_nxt,r_ptr,r_ptr_nxt;
//    logic full_nxt;
//    logic empty_nxt;
    
//    always_ff@(posedge clk,posedge rst)
//    begin
//    if(rst) 
//    begin
//      w_ptr<=0;
//      r_ptr<=0;
//      full<=1'b0;
//      empty<=1'b1;
//    end
//    else
//    begin
//       w_ptr<=w_ptr_nxt;
//       r_ptr<=r_ptr_nxt;
//       full<=full_nxt;
//       empty<=empty_nxt;
//    end
//    end
// always_comb
// begin
// w_ptr_nxt =w_ptr;
// r_ptr_nxt = r_ptr;
// full_nxt =full;
// empty_nxt =empty;
 
// casex({w_en,r_en,empty,full})
// 4'b010x://read
// begin
//       r_ptr_nxt=r_ptr+1;
//       full_nxt=1'b0;
//       if(r_ptr_nxt==w_ptr)
//          empty_nxt=1'b1;
      
//       else
//           empty_nxt=1'b0;
//  end
    

//  4'b10x0://write
// begin
//    w_ptr_nxt = w_ptr+1;
//    empty_nxt = 1'b0;
//    if(w_ptr_nxt==r_ptr)
//       full_nxt= 1'b1;
//    else
//       full_nxt= 1'b0;
// end
//  4'b111x://read and write
// begin
//        w_ptr_nxt =w_ptr;
//        r_ptr_nxt=r_ptr;
   
     
// end
// 4'b110x://read and write
//      begin
//        w_ptr_nxt =w_ptr+1;
//        r_ptr_nxt=r_ptr+1;
//      end
 
// default: ;//case00
 
// endcase
 
//end
//assign w_add =w_ptr;
//assign r_add = r_ptr;
//endmodule

