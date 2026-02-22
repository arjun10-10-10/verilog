module mod_n_counter #(parameter N = 5,n=3)
  (
    input clk, rst,
    output reg [n-1:0] count
);

always @(posedge clk or posedge rst) begin
    if (rst)
        count <= 0;
    else if (count == N-1)
        count <= 0;
    else
        count <= count + 1;
end

endmodule
