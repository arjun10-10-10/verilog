// half subtractor using dataflow 

module half_sub(
    input  a,
    input  b,
    output diff,
    output br
);

assign diff = a ^ b;   
assign br = ~a & b;   
endmodule


// using gate level
module half_sub (
    input a, b,
    output diff,br
);

xor (diff, a, b);   
and (br, ~a, b); 

endmodule
