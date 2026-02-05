//using gate level 

module mux(input s1,s2,a,b,c,d,
output y);
wire w1,w2,w3,w4;

and(w1,~s1,~s2,a);
and(w2,~s1,s2,b);
and(w3,s1,~s2,c);
and(w4,s1,s2,d);

or(y,w1,w3,w2,w4);
endmodule


//using dataflow 

module mux(input s1,s2,a,b,c,d,
output y);


assign y = (~s1 &~s2 &a) |(~s1 &s2 &b)|(s1 &~s2 &c)|(s1 &s2 &d);

endmodule


