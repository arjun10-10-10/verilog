//using data flow
module p_encoder(
input a,b,c,d,
output x,y
);

assign x = d | c;
assign y = d |b | ~c;
endmodule


//using gate level
module p_encoder(
input a,b,c,d,
output x,y
);


or(x,d,c);
or(y,d,b,~c);
endmodule
