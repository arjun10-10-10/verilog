module sipo #(parameter n = 4)
(
    input clk,
    input rst,
    input s_in,
    output reg [n-1:0] p_out
);

always @(posedge clk or posedge rst)
begin
    if (rst)
        p_out <= 0;
    else
        p_out <= {p_out[n-2:0], s_in};
end

endmodule
