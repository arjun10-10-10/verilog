module mod_b (
    input clk,
    input rst_n,
    input empty,
  input [3:0] data_in,
    output reg ren,
    output reg [3:0] data_out
);

    reg [3:0] count;           
    reg [3:0] mem_b [0:9];     

    integer i;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            count <= 0;
            ren <= 0;
            data_out <= 0;

            for (i = 0; i < 10; i = i + 1)
                mem_b[i] <= 0;

        end else begin
            if (!empty && count < 10) begin
                ren <= 1;
                data_out <= data_in;
                mem_b[count] <= data_in;  
                count <= count + 1;
            end else begin
                ren <= 0;
            end
        end
    end

endmodule
