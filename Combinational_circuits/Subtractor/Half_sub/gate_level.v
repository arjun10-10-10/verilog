module half_sub (
    input a, b,
    output diff,br
);

xor (diff, a, b);   
and (br, ~a, b); 

endmodule
