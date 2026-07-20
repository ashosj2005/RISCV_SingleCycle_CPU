module instruction_memory(
    input  [31:0] address,
    output [31:0] instruction
);

reg [31:0] memory [0:255];

initial begin

    // ADDI x1, x0, 5
    memory[0] = 32'h00500093;

    // JAL x5, +8
    memory[1] = 32'h008002EF;

    // ADDI x2, x0, 99 (should be skipped)
    memory[2] = 32'h06300113;

    // ADDI x3, x0, 7 (should execute)
    memory[3] = 32'h00700193;

    // NOPs
    memory[4] = 32'h00000013;
    memory[5] = 32'h00000013;
    memory[6] = 32'h00000013;
    memory[7] = 32'h00000013;

end
assign instruction = memory[address[31:2]];

endmodule

