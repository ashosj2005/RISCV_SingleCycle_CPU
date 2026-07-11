module control_unit_tb;

reg [6:0] opcode;

wire reg_write;
wire [2:0] alu_control;

control_unit uut(
    .opcode(opcode),
    .reg_write(reg_write),
    .alu_control(alu_control)
);

initial begin

    $dumpfile("control_unit.vcd");
    $dumpvars(0, control_unit_tb);

    opcode = 7'b0110011;
    #10;

    opcode = 7'b0000000;
    #10;

    $finish;

end

endmodule
