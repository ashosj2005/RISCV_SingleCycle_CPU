module branch_adder_tb;

reg [31:0] pc;
reg [31:0] branch_immediate;

wire [31:0] branch_target;

branch_adder uut(
    .pc(pc),
    .branch_immediate(branch_immediate),
    .branch_target(branch_target)
);

initial begin

    $dumpfile("branch_adder.vcd");
    $dumpvars(0, branch_adder_tb);

    // Forward branch
    pc = 32'd100;
    branch_immediate = 32'd8;
    #10;

    // Backward branch
    pc = 32'd100;
    branch_immediate = -32'd4;
    #10;

    $finish;

end

endmodule
