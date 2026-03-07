module freq_div_50M_to_5k (input clk, rst,       
    output reg fout  );

reg [13:0] count;   
always @(posedge clk or posedge rst) begin
    if (rst) begin
        count <= 0;
        fout <= 0;
    end else begin
        if (count == 4999) begin   
            count <= 0;
            fout <= ~fout;       
        end else begin
            count <= count + 1;
        end
    end
end

endmodule
