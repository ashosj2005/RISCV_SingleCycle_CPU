module branch_immediate_generator(
    input [31:0] instruction,
    output reg [31:0] branch_immediate
);

always @(*) begin

    branch_immediate = {
        {19{instruction[31]}},
        instruction[31],
        instruction[7],
        instruction[30:25],
        instruction[11:8],
        1'b0
    };

end

endmodule
