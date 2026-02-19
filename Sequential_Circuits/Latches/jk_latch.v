module jk_latch(
input j,k,clk,rst,
output reg q
);

always @(*) begin
    if (rst)
        q = 1'b0;
    else if (clk) begin
        if (j & k)
            q = ~q;
        else if (j)
            q = 1'b1;
        else if (k)
            q = 1'b0;
    end
end

endmodule
