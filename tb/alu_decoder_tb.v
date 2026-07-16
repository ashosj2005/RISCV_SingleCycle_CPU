module alu_decoder_tb;

reg [2:0] funct3;
reg [6:0] funct7;
wire [2:0] alu_control;

alu_decoder uut(
    .funct3(funct3),
    .funct7(funct7),
    .alu_control(alu_control)
);

initial begin

    $dumpfile("alu_decoder.vcd");
    $dumpvars(0, alu_decoder_tb);

    // ADD
    funct7 = 7'b0000000;
    funct3 = 3'b000;
    #10;

    // SUB
    funct7 = 7'b0100000;
    funct3 = 3'b000;
    #10;

    // AND
    funct7 = 7'b0000000;
    funct3 = 3'b111;
    #10;

    // OR
    funct7 = 7'b0000000;
    funct3 = 3'b110;
    #10;

    $finish;

end

endmodule
