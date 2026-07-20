module jal_immediate_generator(
    input  [31:0] instruction,
    output reg [31:0] jal_immediate
);

always @(*) begin
    jal_immediate = {
        {11{instruction[31]}},
        instruction[31],
        instruction[19:12],
        instruction[20],
        instruction[30:21],
        1'b0
    };
end

endmodule
