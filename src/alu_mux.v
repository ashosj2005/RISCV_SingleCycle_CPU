module alu_mux(
    input [31:0] reg_data,
    input [31:0] immediate,
    input alu_src,
    output [31:0] alu_input_b
);

assign alu_input_b =
        (alu_src == 1'b0) ? reg_data :
                            immediate;

endmodule
