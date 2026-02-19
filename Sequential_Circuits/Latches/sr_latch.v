module sr_latch(input s,r,clk,rst,output reg q);

always @(*) begin
    if (rst)
        q = 0;
    else if (clk)
      begin
        if (s && !r)
            q = 1;
        else if (!s && r)
            q = 0;
        else if (s && r)
            q = x;  
    end
end endmodule
