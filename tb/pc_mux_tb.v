module pc_mux_tb;

reg [31:0] pc_plus4;
reg [31:0] branch_target;
reg pc_src;

wire [31:0] next_pc;

pc_mux uut(
    .pc_plus4(pc_plus4),
    .branch_target(branch_target),
    .pc_src(pc_src),
    .next_pc(next_pc)
);

initial begin

    $dumpfile("pc_mux.vcd");
    $dumpvars(0, pc_mux_tb);

    pc_plus4 = 32'd104;
    branch_target = 32'd200;

    pc_src = 0;
    #10;

    pc_src = 1;
    #10;

    $finish;

end

endmodule
