module freq_div (
    input clk,
    input rst,
    output fout
);
  reg d=0;
  reg [2:0] count=0;
  
always @(posedge clk ) begin
    if (rst)
        count <= 3'b000;
    else if (count == 3'b101)   // 5 in decimal
        count <= 3'b000;
    else
        count <= count + 1;
end
  
  always@(posedge clk)
    begin
      d<=count[2];
    end
  assign fout = d | count[2];

endmodule
