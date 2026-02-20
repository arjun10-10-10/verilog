module p_encoder(
input a,b,c,d,
output x,y
);


or(x,d,c);
or(y,d,b,~c);
endmodule
