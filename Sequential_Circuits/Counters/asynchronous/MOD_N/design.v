module t_ff (input clk, rst, output reg q);
always @(negedge clk or posedge rst) begin
    if (rst)
        q <= 1'b0;
    else
        q <= ~q;
end
endmodule

module async_modN #(  parameter N = 6, n=3)
  ( input clk,rst,
  output [n-1:0] q);

wire stop;
assign stop = rst | (q == N);

  
genvar i;
generate
  for (i = 0; i < n; i = i + 1) begin : flop
        if (i == 0)
          t_ff ff (clk, stop, q[i]);
        else
          t_ff ff (q[i-1],stop, q[i]);
    end
endgenerate

endmodule
