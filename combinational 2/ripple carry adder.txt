module full_adder (
    
    output sum,
    output cout,input  a,
    input  b,
    input  cin
);

assign sum  = a ^ b ^ cin;
assign cout = (a & b) | (b & cin) | (a & cin);

endmodule


module ra(output [3:0]s,output co,input [3:0] a,b,input c);
   wire w1,w2,w3; 
  
  
  full_adder fa1(s[0],w1,a[0],b[0],c);  
  full_adder fa2(s[1],w2,a[1],b[1],w1);  
  full_adder fa3(s[2],w3,a[2],b[2],w2); 
  full_adder fa4(s[3],co,a[3],b[3],w3);
endmodule