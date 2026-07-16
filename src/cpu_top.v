module cpu_top(
    input clk,
    input reset
);

wire [31:0] pc_out;
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
wire [31:0] alu_result;
wire [31:0] memory_data;
wire [31:0] write_back_data;
wire [31:0] immediate;
wire [31:0] alu_input_b;

// Instruction field extraction
assign rs1    = instruction[19:15];
assign rs2    = instruction[24:20];
assign rd     = instruction[11:7];
assign funct3 = instruction[14:12];
// Program Counter
pc PC(
    .clk(clk),
    .reset(reset),
    .pc_out(pc_out)
);

// Instruction Memory
instruction_memory IMEM(
    .address(pc_out),
    .instruction(instruction)
);

// Control Unit
control_unit CU(
    .opcode(instruction[6:0]),
    .reg_write(reg_write),
    .alu_src(alu_src),
    .mem_read(mem_read),
    .mem_write(mem_write),
    .mem_to_reg(mem_to_reg)
);
// ALU Decoder
alu_decoder ALU_DEC(
    .funct3(funct3),
    .funct7(funct7),
    .alu_control(alu_control)
);
immediate_generator IMM_GEN(
    .instruction(instruction),
    .immediate(immediate)
);
alu_mux ALU_MUX(
    .reg_data(read_data2),
    .immediate(immediate),
    .alu_src(alu_src),
    .alu_input_b(alu_input_b)
);
assign write_back_data =
        mem_to_reg ? memory_data :
                     alu_result;
// Register File
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
data_memory DMEM(
    .clk(clk),
    .mem_write(mem_write),
    .mem_read(mem_read),
    .address(alu_result),
    .write_data(read_data2),
    .read_data(memory_data)
);
// ALU
alu ALU(
    .A(read_data1),
    .B(alu_input_b),
    .ALUControl(alu_control),
    .Result(alu_result)
);
endmodule
