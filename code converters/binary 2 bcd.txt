// using gate level

module binary2bcd(
input a,b,c,d,
output e,f,g,h,i ,
wire w1,w2,w3,w4,w5,w6    
);

and(w1,a,c);
and(w2,a,b);
or(e,w1,w2);

and(f,a,~b,~c);


and(w3,b,c);
and(w4,~a,b);
or(e,w3,w4);

and(w5,~a,c);
and(w6,a,b,~c);
or(e,w5,w6);

buf(i,d);

endmodule



// using dataflow

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






endmodule
