module g2b(
output b0,b1,b2,b3,
input g0,g1,g2,g3);


buf(b0,g0);
xor(b1,g1,b0);
xor(b2,g2,b1);
xor(b3,g3,b2);

endmodule
