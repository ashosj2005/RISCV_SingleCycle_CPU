module immediate_generator(
    input [31:0] instruction,
    output reg [31:0] immediate
);

always @(*) begin

    case(instruction[6:0])

        // ADDI, LW
        7'b0010011,
        7'b0000011:
            immediate = {{20{instruction[31]}},
                         instruction[31:20]};

        // SW
        7'b0100011:
            immediate = {{20{instruction[31]}},
                         instruction[31:25],
                         instruction[11:7]};

        default:
            immediate = 32'b0;

    endcase

end

endmodule
