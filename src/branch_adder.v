module branch_adder(
    input  [31:0] pc,
    input  [31:0] branch_immediate,
    output [31:0] branch_target
);

assign branch_target = pc + branch_immediate;

endmodule
