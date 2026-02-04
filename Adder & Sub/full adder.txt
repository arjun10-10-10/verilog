//using dataflow
module full_adder (
    input  a,
    input  b,
    input  cin,
    output sum,
    output cout
);

assign sum  = a ^ b ^ cin;
assign cout = (a & b) | (b & cin) | (a & cin);

endmodule


//using gate level
module full_adder_gl (
    input  a,
    input  b,
    input  cin,
    output sum,
    output cout
);

wire w1, w2, w3;

xor (w1, a, b);
xor (sum, w1, cin);


and (w2, a, b);
and (w3, w1, cin);
or  (cout, w2, w3);

endmodule
