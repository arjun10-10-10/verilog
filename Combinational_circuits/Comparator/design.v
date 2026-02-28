module comp_bit(
    input   A,
    input   B,
    output gt,
    output lt,
    output eq
);

assign gt = (A > B);
assign lt = (A < B);
assign eq = (A == B);

endmodule
