module p_encoder(
input a,b,c,d,
output x,y
);

assign x = d | c;
assign y = d |b | ~c;
endmodule
