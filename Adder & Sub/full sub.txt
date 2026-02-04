//using dataflow

module full_sub (
    input  a,
    input  b,
    input  bin,
    output diff,
    output br
);

assign diff  = a ^ b ^ bin;
assign br = (~a & b) | (~diff&bin);
endmodule


//using gate level


module full_sub (
    input  a,
    input  b,
    input  bin,
    output diff,
    output br
);

wire w1, w2, w3;

xor (w1, a, b);
xor (diff, w1, bin);


and (w2,~ a, b);
and (w3, ~w1, bin);
or  (br, w2, w3);

endmodule
