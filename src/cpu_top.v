module cpu_top(
    input clk,
    input reset
);

wire [31:0] pc_out;
wire [31:0] instruction;

wire reg_write;
wire [2:0] alu_control;

pc PC(
    .clk(clk),
    .reset(reset),
    .pc_out(pc_out)
);

instruction_memory IMEM(
    .address(pc_out),
    .instruction(instruction)
);

control_unit CU(
    .opcode(instruction[6:0]),
    .reg_write(reg_write),
    .alu_control(alu_control)
);

endmodule
