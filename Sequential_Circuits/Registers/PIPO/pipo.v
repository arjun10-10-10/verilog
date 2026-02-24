module d_ff(
    input clk,
    input rst,
    input d,
    output reg q
);

always @(posedge clk or posedge rst)
begin
    if (rst)
        q <= 1'b0;
    else
        q <= d;
end

endmodule

module pipo#(parameter n=4 )
  (input clk,rst,
   input [n-1:0]data_in,output   [n-1:0]data_out);
  
  genvar i;
  generate
    
    for(i=0;i<n;i++)begin:flop
    

      d_ff name(clk,rst,data_in[i],data_out[i]);
      
      
    end
      
  endgenerate
  
endmodule
