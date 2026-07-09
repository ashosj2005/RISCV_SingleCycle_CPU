module alu_tb;

reg [31:0] A;
reg [31:0] B;
reg [2:0] ALUControl;

wire [31:0] Result;

alu uut(
    .A(A),
    .B(B),
    .ALUControl(ALUControl),
    .Result(Result)
);

initial begin

    $dumpfile("alu.vcd");
    $dumpvars(0, alu_tb);

    A = 10;
    B = 5;

    ALUControl = 3'b000;
    #10;

    ALUControl = 3'b001;
    #10;

    ALUControl = 3'b010;
    #10;

    ALUControl = 3'b011;
    #10;

    ALUControl = 3'b100;
    #10;

    $finish;
end

endmodule
