module cpu_top_tb;

reg clk;
reg reset;

cpu_top uut(
    .clk(clk),
    .reset(reset)
);

always #5 clk = ~clk;

initial begin

    $dumpfile("cpu_top.vcd");
    $dumpvars(0, cpu_top_tb);

    clk = 0;

    reset = 1;
    #10;

    reset = 0;

    #60;

    $finish;

end

endmodule
