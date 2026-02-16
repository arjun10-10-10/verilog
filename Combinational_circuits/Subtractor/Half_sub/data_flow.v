module half_sub(
    input  a,
    input  b,
    output diff,
    output br
);

assign diff = a ^ b;   
assign br = ~a & b;   
endmodule

