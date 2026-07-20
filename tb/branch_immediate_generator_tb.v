module branch_immediate_generator_tb;

reg [31:0] instruction;
wire [31:0] branch_immediate;

branch_immediate_generator uut(
    .instruction(instruction),
    .branch_immediate(branch_immediate)
);

initial begin

    $dumpfile("branch_immediate_generator.vcd");
    $dumpvars(0, branch_immediate_generator_tb);

    instruction = 32'h00208463;
    #10;

    instruction = 32'hFE208EE3;
    #10;

    $finish;

end

endmodule
