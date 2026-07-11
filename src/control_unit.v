module control_unit(
    input [6:0] opcode,
    output reg reg_write,
    output reg [2:0] alu_control
);

always @(*) begin

    case(opcode)

        7'b0110011: begin
            reg_write = 1'b1;
            alu_control = 3'b000;
        end

        default: begin
            reg_write = 1'b0;
            alu_control = 3'b000;
        end

    endcase

end

endmodule
