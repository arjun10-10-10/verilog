module parity_gen#(parameter n =4)
  (
  input [n-1:0]data,
  output  even_parity_bit,odd_parity_bit
);
  
  
  assign even_parity_bit=  ^data;
  assign odd_parity_bit= ~(^data) ;
      
      endmodule
