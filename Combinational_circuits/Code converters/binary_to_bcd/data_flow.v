module binary2bcd(
input a,b,c,d,
output e,f,g,h,i 
);

assign e = (a&c) | (a&b);
assign f = a & ~b & ~c ;
assign g = (b&c) | (~a&b);
assign h = (~a&c) | (a&b&~c);
assign i = d;

endmodule
