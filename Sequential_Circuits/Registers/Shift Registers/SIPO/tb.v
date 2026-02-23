module sipo_tb;

parameter n = 4;

reg clk;
reg rst;
reg s_in;
wire [n-1:0] p_out;

sipo #(n) dut (
    .clk(clk),
    .rst(rst),
    .s_in(s_in),
    .p_out(p_out)
);

always #5 clk = ~clk;

initial
begin
    $dumpfile("sipo.vcd");
    $dumpvars(0, sipo_tb);
    $monitor("time=%0t rst=%b s_in=%b p_out=%b", $time, rst, s_in, p_out);

    clk = 0;
    rst = 1;
    s_in = 0;

    #10 rst = 0;

    #10 s_in = 1;
    #10 s_in = 0;
    #10 s_in = 1;
    #10 s_in = 1;

    #40;

    $finish;
end

endmodule
