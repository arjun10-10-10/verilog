module t_ff_using_d (
    input clk,
    input rst,
    input T,
    output reg Q
);

wire D;

assign D = T ^ Q;

always @(posedge clk or posedge rst) begin
    if (rst)
        Q <= 1'b0;
    else
        Q <= D;
end

endmodule
