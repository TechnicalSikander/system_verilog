

module tb_bar_shift();

//signal declration
logic [7:0] a;
logic [2:0] s;
logic [7:0] y;
    

//instantiatie uut
barrel_shifter uut(.*);

//test_vectors
initial begin
a= 8'b00010001;
s=3'b000;
#10 
a= 8'b00010001;
s=3'b010;

#10 
a= 8'b00010001;
s=3'b110;
#10
$stop;
end
 
endmodule
