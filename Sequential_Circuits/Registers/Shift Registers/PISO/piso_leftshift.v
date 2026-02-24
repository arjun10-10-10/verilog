module piso #(parameter n = 4)
(
    input clk,
    input rst,
    input load,
    input [n-1:0] data,
    output dout
);

reg [n-1:0] q;

assign dout = q[n-1];   // MSB first (left shift output)

always @(posedge clk or posedge rst)
begin
    if (rst)
        q <= 0;
    else if (load)
        q <= data;                
    else
        q <= {q[n-2:0], 1'b0};    
end

endmodule
