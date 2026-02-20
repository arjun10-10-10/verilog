module demux(output a,b,c,d,
input x,s1,s2);


assign a = ~s1 &~s2 &x;
assign b = ~s1 &s2 &x;
assign c = s1 &~s2 &x;
assign d = s1 &s2 &x;

endmodule
