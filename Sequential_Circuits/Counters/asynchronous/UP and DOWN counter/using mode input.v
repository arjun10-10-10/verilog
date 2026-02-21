module tff(
    input t,
    input clk,
    input rst,
    output reg q
);

  always @(negedge clk or posedge rst) begin
    if (rst)
      q <= 1'b0;
    else if (t)
      q <= ~q;
  end

endmodule



module asyn_up_down_counter #(parameter n = 4)
( input mode,  clk, rst,
    output [n-1:0] );

  genvar i;

  generate
    for (i = 0; i < n; i = i + 1) begin : flipflop
      
      if (i == 0) begin
        tff flop(1'b1, clk, rst, q[i]);
      end
      else begin
        wire s_clk;
        
        assign s_clk = (mode) ? ~q[i-1] : q[i-1];

        tff flop(1'b1, s_clk, rst, q[i]);
      end

    end
  endgenerate

endmodule
