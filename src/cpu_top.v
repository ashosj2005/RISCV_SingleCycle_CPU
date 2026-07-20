module cpu_top(
    input clk,
    input reset
);

//====================
// Wires
//====================
wire branch;
wire branch_taken;
wire jal;
wire pc_src;

wire [31:0] jal_immediate;
wire [31:0] jal_target;
wire [31:0] pc_out;
wire [31:0] next_pc;
wire [31:0] pc_plus4;
wire [31:0] instruction;

wire reg_write;
wire alu_src;
wire mem_read;
wire mem_write;
wire mem_to_reg;

wire [4:0] rs1;
wire [4:0] rs2;
wire [4:0] rd;

wire [2:0] funct3;
wire [6:0] funct7;

wire [2:0] alu_control;

wire [31:0] read_data1;
wire [31:0] read_data2;
wire [31:0] immediate;
wire [31:0] branch_immediate;
wire [31:0] pc_target;

wire [31:0] alu_input_b;
wire [31:0] alu_result;

wire [31:0] memory_data;
wire [31:0] write_back_data;

wire [31:0] branch_target;

//====================
// Instruction Decode
//====================

assign rs1 = instruction[19:15];
assign rs2 = instruction[24:20];
assign rd  = instruction[11:7];

assign funct3 = instruction[14:12];
assign funct7 = instruction[31:25];

assign pc_plus4 = pc_out + 32'd4;

//====================
// Branch Decision
//====================

assign pc_src = jal | (branch & branch_taken);

//====================
// Program Counter
//====================

pc PC(
    .clk(clk),
    .reset(reset),
    .next_pc(next_pc),
    .pc_out(pc_out)
);

//====================
// PC MUX
//====================

pc_mux PC_MUX(
    .pc_plus4(pc_plus4),
    .branch_target(pc_target),
    .pc_src(pc_src),
    .next_pc(next_pc)
);
//====================
// Instruction Memory
//====================

instruction_memory IMEM(
    .address(pc_out),
    .instruction(instruction)
);

//====================
// Control Unit
//====================

control_unit CU(
    .opcode(instruction[6:0]),
    .reg_write(reg_write),
    .alu_src(alu_src),
    .mem_read(mem_read),
    .mem_write(mem_write),
    .mem_to_reg(mem_to_reg),
    .branch(branch),
    .jal(jal)
);
//====================
// ALU Decoder
//====================

alu_decoder ALU_DEC(
    .funct3(funct3),
    .funct7(funct7),
    .alu_control(alu_control)
);

//====================
// Immediate Generator
//====================

immediate_generator IMM_GEN(
    .instruction(instruction),
    .immediate(immediate)
);

//====================
// Branch Immediate Generator
//====================

branch_immediate_generator BR_IMM(
    .instruction(instruction),
    .branch_immediate(branch_immediate)
);

jal_immediate_generator JAL_IMM(
    .instruction(instruction),
    .jal_immediate(jal_immediate)
);

//====================
// Register File
//====================

register_file RF(
    .clk(clk),
    .we(reg_write),
    .rs1(rs1),
    .rs2(rs2),
    .rd(rd),
    .write_data(write_back_data),
    .read_data1(read_data1),
    .read_data2(read_data2)
);

//====================
// Branch Comparator
//====================

branch_comparator BRANCH_COMP(
    .rs1_data(read_data1),
    .rs2_data(read_data2),
    .branch_taken(branch_taken)
);

//====================
// Branch Adder
//====================

branch_adder BRANCH_ADD(
    .pc(pc_out),
    .branch_immediate(branch_immediate),
    .branch_target(branch_target)
);
assign jal_target = pc_out + jal_immediate;
assign pc_target = jal ? jal_target : branch_target;
//====================
// ALU Input MUX
//====================

alu_mux ALU_MUX(
    .reg_data(read_data2),
    .immediate(immediate),
    .alu_src(alu_src),
    .alu_input_b(alu_input_b)
);

//====================
// ALU
//====================

alu ALU(
    .A(read_data1),
    .B(alu_input_b),
    .ALUControl(alu_control),
    .Result(alu_result)
);

//====================
// Data Memory
//====================

data_memory DMEM(
    .clk(clk),
    .mem_write(mem_write),
    .mem_read(mem_read),
    .address(alu_result),
    .write_data(read_data2),
    .read_data(memory_data)
);

//====================
// Write Back
//====================

assign write_back_data =
    jal        ? pc_plus4 :
    mem_to_reg ? memory_data :
                 alu_result;
endmodule
