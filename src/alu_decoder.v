module alu_decoder(
    input [2:0] funct3,
    input [6:0] funct7,
    output reg [2:0] alu_control
);

always @(*) begin

    case({funct7, funct3})

        {7'b0000000,3'b000}: alu_control = 3'b000; // ADD
        {7'b0100000,3'b000}: alu_control = 3'b001; // SUB
        {7'b0000000,3'b111}: alu_control = 3'b010; // AND
        {7'b0000000,3'b110}: alu_control = 3'b011; // OR

        default: alu_control = 3'b000;

    endcase

end

endmodule
