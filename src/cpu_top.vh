module cpu_top(
    input clk,
    input reset
);

wire [31:0] pc_out;
wire [31:0] instruction;

wire reg_write;
wire [2:0] alu_control;

wire [31:0] read_data1;
wire [31:0] read_data2;
wire [31:0] alu_result;
wire [4:0] rs1;
wire [4:0] rs2;
wire [4:0] rd;
wire [2:0] funct3;
wire [6:0] funct7;
// Instruction field extraction
assign rs1    = instruction[19:15];
assign rs2    = instruction[24:20];
assign rd     = instruction[11:7];
assign funct3 = instruction[14:12];
assign funct7 = instruction[31:25];

// ALU Decoder
alu_decoder ALU_DEC(
    .funct3(funct3),
    .funct7(funct7),
    .alu_control(alu_control)
);
control_unit CU(
    .opcode(instruction[6:0]),
    .reg_write(reg_write)
);

pc PC(
    .clk(clk),
    .reset(reset),
    .pc_out(pc_out)
);

instruction_memory IMEM(
    .address(pc_out),
    .instruction(instruction)
);

register_file RF(
    .clk(clk),
    .we(reg_write),

.rs1(rs1),
.rs2(rs2),
.rd(rd),

    .write_data(alu_result),

    .read_data1(read_data1),
    .read_data2(read_data2)
);

alu ALU(
    .A(read_data1),
    .B(read_data2),
    .ALUControl(alu_control),
    .Result(alu_result)
);

endmodule
