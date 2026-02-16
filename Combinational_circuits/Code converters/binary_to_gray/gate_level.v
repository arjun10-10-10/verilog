module b2g(
input b0,b1,b2,b3,
output g0,g1,g2,g3);
buf(g0,b0);
xor(g1,b0,b1);
xor(g2,b1,b2);
xor(g3,b2,b3);
endmodule
