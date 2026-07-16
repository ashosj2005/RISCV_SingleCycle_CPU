module control_unit(
    input [6:0] opcode,

    output reg reg_write,
    output reg alu_src,
    output reg mem_read,
    output reg mem_write,
    output reg mem_to_reg
);

always @(*) begin

    reg_write  = 0;
    alu_src    = 0;
    mem_read   = 0;
    mem_write  = 0;
    mem_to_reg = 0;

    case(opcode)

        // R-Type
        7'b0110011: begin
            reg_write = 1;
            alu_src   = 0;
        end
                // ADDI
        7'b0010011: begin
            reg_write = 1;
            alu_src   = 1;
        end
        // LW
        7'b0000011: begin
            reg_write  = 1;
            alu_src    = 1;
            mem_read   = 1;
            mem_to_reg = 1;
        end

    endcase

end

endmodule
