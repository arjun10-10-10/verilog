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

module siso #(parameter n = 4)
(
    input clk,
    input rst,
    input data_in,
    output data_out
);

wire [n-1:0] q;

genvar i;
generate
    for(i = 0; i < n; i = i + 1)
    begin : ff
        if(i == 0)
            d_ff dff (.clk(clk), .rst(rst), .d(data_in), .q(q[i]));
        else
            d_ff dff (.clk(clk), .rst(rst), .d(q[i-1]), .q(q[i]));
    end
endgenerate

assign data_out = q[n-1];

endmodule
