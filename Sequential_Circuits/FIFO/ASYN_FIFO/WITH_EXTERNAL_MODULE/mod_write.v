module mod_a (
    input clk,
    input rst_n,
    input full,
    output reg wen,
  output reg [3:0] data_out
);

    reg [3:0] mem_a [0:4];   
  reg [2:0] index;         // to send n 4 bit data in sequence

    
    initial begin
        mem_a[0] = 4'b0001;
        mem_a[1] = 4'b0010;
        mem_a[2] = 4'b0011;
        mem_a[3] = 4'b0100;
        mem_a[4] = 4'b0101;
    end

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            index <= 0;
            wen <= 0;
            data_out <= 0;
        end else begin
            if (!full && index < 5) begin
                wen <= 1;
                data_out <= mem_a[index];  
                index <= index + 1;    
            end else begin
                wen <= 0;  
            end
        end
    end

endmodule
