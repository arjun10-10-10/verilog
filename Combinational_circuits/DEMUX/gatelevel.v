module demux(output a,b,c,d,
input x,s1,s2);


and(a,~s1,~s2,x);
and(b,~s1,s2,x);
and(c,s1,~s2,x);
and(d,s1,s2,x);

endmodule
