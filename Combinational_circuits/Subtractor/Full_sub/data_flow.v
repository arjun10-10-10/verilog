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

