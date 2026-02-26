module T_FF (input clk,reset,T,output reg Q);
always @(posedge clk or posedge reset) 
  begin
  if(reset)
    Q <=0;
  else
     Q<= T? ~Q:Q;
end
endmodule

module D_FF(input clk,reset,D,output Q);

  T_FF flop(.clk(clk),.reset(reset),.T(D^Q),.Q(Q));
endmodule
