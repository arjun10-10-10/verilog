module parity_checker #(parameter n = 4)
(
    input  [n-1:0] data,
    input  parity_bit,
    output error,odderror
);

  assign error = ^{data, parity_bit};      //1 means error happened
  assign odderror = ~(^({data, parity_bit}));    
endmodule
