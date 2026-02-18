module tlatch (
    input  T, clk,
    output reg q
);

    always @(*) begin
        if (clk) begin
            if (T)
                q = ~q;   
        end
    end
endmodule
