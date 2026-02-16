module b2g(
input b0,b1,b2,b3,
output g0,g1,g2,g3);
assign g0=b0;
assign g1=b0^b1;
assign g2=b2^b1;
assign g3=b2^b3;
endmodule



/* 
module b2g(
input [3:0],
output [3:0]);

assign g = b ^ (b >> 1);


 
endmodule*/
