module alu_mux_tb;

reg [31:0] reg_data;
reg [31:0] immediate;
reg alu_src;

wire [31:0] alu_input_b;

alu_mux uut(
    .reg_data(reg_data),
    .immediate(immediate),
    .alu_src(alu_src),
    .alu_input_b(alu_input_b)
);

initial begin

    $dumpfile("alu_mux.vcd");
    $dumpvars(0, alu_mux_tb);

    reg_data  = 32'd10;
    immediate = 32'd5;

    // Select register
    alu_src = 0;
    #10;

    // Select immediate
    alu_src = 1;
    #10;

    // New values
    reg_data  = 32'd20;
    immediate = 32'd7;

    alu_src = 0;
    #10;

    alu_src = 1;
    #10;

    $finish;

end

endmodule
