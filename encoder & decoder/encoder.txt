//using data flow
module encoder(
input a,b,c,d,
output x,y
);

assign x = d | c;
assign y = d |b ;
endmodule




//gate level
module encoder(
input a,b,c,d,
output x,y
);


or(x,d,c);
or(y,d,b,);
endmodule

