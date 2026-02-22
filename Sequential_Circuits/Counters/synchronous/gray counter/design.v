module gray_counter 
  #(parameter N = 3)
  (input clk,rst,
   output [N-1:0] gray);

  reg [N-1:0] count;
always @(posedge clk or posedge rst) begin
    if (rst)
        count <= 0;
    else
        count <=count + 1;
end

  assign gray = count ^ (count >> 1);

endmodule
