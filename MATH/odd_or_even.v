module oddreven #(parameter N=4)(input [N-1:0]a,output even,odd );
  assign odd = (a%2==0)?0 :1;
  assign even = (a%2==0)?1:0;
endmodule
