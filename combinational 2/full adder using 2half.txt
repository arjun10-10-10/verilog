module half_adder(output s,c,input a,b);
   assign s =a^b;
  assign c= a&b;
endmodule

module full(output sum,carry,input x,y,z);
wire w1,c1,c2;
  half_adder ha1(w1,c1,x,y);
  half_adder ha2(sum,c2,w1,z );
      assign carry = c1|c2;  
endmodule