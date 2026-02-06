// 2:4 decoder using gate level
module decoder(
    input a, b,
    output y0, y1, y2, y3
);

wire na, nb;

not (na, a);
not (nb, b);

and (y0, na, nb);
and (y1, na, b);
and (y2, a, nb);
and (y3, a, b);

endmodule

// 2:4 decoder using dataflow
module decoder(
    input a, b,
    output y0, y1, y2, y3
);

assign y0 = ~a & ~b;
assign y1 = ~a &  b;
assign y2 =  a & ~b;
assign y3 =  a &  b;

endmodule
