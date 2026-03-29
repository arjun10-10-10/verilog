module fifo_mem #(
    parameter data_width = 8,
    parameter addr_size = 4
)(
    input wclk,
    input wenable,
    input [addr_size-1:0] waddr,
    input [data_width-1:0] wdata,

    input rclk,
    input renable,
    input [addr_size-1:0] raddr,
    output reg [data_width-1:0] rdata
);

    reg [data_width-1:0] mem [0:(1<<addr_size)-1];

    always @(posedge wclk) begin
        if (wenable)
            mem[waddr] <= wdata;
    end

    always @(posedge rclk) begin
        if (renable)
            rdata <= mem[raddr];
    end

endmodule
