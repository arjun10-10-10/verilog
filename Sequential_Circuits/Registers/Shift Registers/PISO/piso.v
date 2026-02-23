module piso #(parameter n = 4)
(
    input clk,
    input rst,
    input load,
    input [n-1:0] data_in,
    output s_out
);

reg [n-1:0] q;
integer i;

assign s_out = q[0];   

always @(posedge clk or posedge rst)
begin
    if (rst)
        q <= 0;
        
    else if (load)
        q <= data_in;
        
    else
    begin
        for (i = 0; i < n-1; i = i + 1)
            q[i] <= q[i+1];
            
        q[n-1] <= 1'b0;  
end
end

endmodule
