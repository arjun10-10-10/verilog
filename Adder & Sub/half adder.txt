// half adder using dataflow 

module half_adder (
    input  a,
    input  b,
    output sum,
    output carry
);

assign sum   = a ^ b;   
assign carry = a & b;   
endmodule



// using gatelevel

module half_adder (
    input a, b,
    output sum, carry
);

xor (sum, a, b);   
and (carry, a, b); 

endmodule
