module fifo (
    input clk, 
    input rst, 
    input wen, 
    input ren, 
    input din, 
    output reg dout 
   
);
   wire full,empty;
  reg [2:0] wptr=0, rptr=0;
    reg [0:7] mem;
    integer i;

  assign empty = (wptr == rptr)?1:0;
  assign full  = ((wptr + 3'b001) == rptr)?1:0;

    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            wptr <= 0;
            rptr <= 0;
            dout <= 0;
            for (i = 0; i < 8; i = i + 1)
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
