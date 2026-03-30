module fifo #(
    parameter DATA_WIDTH = 4,
    parameter DEPTH = 8,
    parameter ADDR_WIDTH = $clog2(DEPTH)
)(
    input clk,
    input rst_n,
    input wen,
    input ren,
    input [DATA_WIDTH-1:0] din,
    output reg [DATA_WIDTH-1:0] dout,
    output full,
    output empty
);

    reg [ADDR_WIDTH-1:0] wptr = 0, rptr = 0;
    reg [DATA_WIDTH-1:0] mem [0:DEPTH-1];
    integer i;
    assign empty = (wptr == rptr);
    assign full  = ((wptr + 1'b1) == rptr);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            wptr <= 0;
            rptr <= 0;
            dout <= 0;

           for (i = 0; i < DEPTH; i = i + 1)
                mem[i] <= 0;

        end else begin
            if (wen && !full) begin
                mem[wptr] <= din;
                wptr <= wptr + 1;
            end
            if (ren && !empty) begin
                dout <= mem[rptr];
                rptr <= rptr + 1;
            end
        end
    end

endmodule
