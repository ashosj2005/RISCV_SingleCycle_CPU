module immediate_generator_tb;

reg [31:0] instruction;
wire [31:0] immediate;

immediate_generator uut(
    .instruction(instruction),
    .immediate(immediate)
);

initial begin

    $dumpfile("immediate_generator.vcd");
    $dumpvars(0, immediate_generator_tb);

    // ADDI x1,x0,1
    instruction = 32'h00100093;
    #10;

    // ADDI x2,x0,2
    instruction = 32'h00200113;
    #10;

    // ADDI x3,x0,10
    instruction = 32'h00A00193;
    #10;

    // NOP
    instruction = 32'h00000013;
    #10;

    $finish;

end

endmodule
