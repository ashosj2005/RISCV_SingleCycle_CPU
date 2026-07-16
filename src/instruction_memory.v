module instruction_memory(
    input [31:0] address,
    output [31:0] instruction
);

reg [31:0] memory [0:255];

initial begin

    // ADDI x1,x0,1
    memory[0] = 32'h00100093;

    // ADDI x2,x0,2
    memory[1] = 32'h00200113;

    // ADD x3,x1,x3
    memory[2] = 32'h003081B3;

    // SUB x4,x1,x2
    memory[3] = 32'h40208233;

    // AND x5,x1,x2
    memory[4] = 32'h0020F2B3;

    // OR x6,x1,x2
    memory[5] = 32'h0020E333;

    // NOP
    memory[6] = 32'h00000013;

end

assign instruction = memory[address[31:2]];

endmodule
