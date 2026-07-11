module pc_tb;

reg clk;
reg reset;

wire [31:0] pc_out;

pc uut(
    .clk(clk),
    .reset(reset),
    .pc_out(pc_out)
);

always #5 clk = ~clk;

initial begin
    $dumpfile("pc.vcd");
    $dumpvars(0, pc_tb);

    clk = 0;

    // Reset CPU
    reset = 1;
    #10;

    reset = 0;

    // Let PC run
    #50;

    $finish;
end

endmodule
