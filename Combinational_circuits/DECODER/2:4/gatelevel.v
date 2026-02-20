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
