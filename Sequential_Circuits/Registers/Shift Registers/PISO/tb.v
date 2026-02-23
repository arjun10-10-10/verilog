module piso_tb;

parameter n = 4;

reg clk;
reg rst;
reg load;
reg [n-1:0] data_in;
wire s_out;

piso #(n) dut (
    .clk(clk),
    .rst(rst),
    .load(load),
    .data_in(data_in),
    .s_out(s_out)
);

always #5 clk = ~clk;

initial
begin
    $dumpfile("piso.vcd");
    $dumpvars(0, piso_tb);

    $monitor("Time=%0t rst=%b load=%b data_in=%b s_out=%b",
              $time, rst, load, data_in, s_out);

    clk = 0;
    rst = 1;
    load = 0;
    data_in = 4'b0000;

    #10 rst = 0;

    #10 load = 1;
        data_in = 4'b1011;

    #10 load = 0;

    #60;

    $finish;
end

endmodule
