`timescale 1ns/1ps

module data_memory_tb;

reg clk;
reg mem_write;
reg mem_read;

reg [31:0] address;
reg [31:0] write_data;

wire [31:0] read_data;

data_memory uut(
    .clk(clk),
    .mem_write(mem_write),
    .mem_read(mem_read),
    .address(address),
    .write_data(write_data),
    .read_data(read_data)
);

always #5 clk = ~clk;

initial begin

    $dumpfile("data_memory.vcd");
    $dumpvars(0,data_memory_tb);

    clk = 0;

    mem_write = 1;
    mem_read  = 0;
    address   = 32'd0;
    write_data = 32'h12345678;

    #10;

    mem_write = 0;
    mem_read  = 1;

    #10;

    address = 32'd4;
    mem_write = 1;
    mem_read = 0;
    write_data = 32'hAAAAAAAA;

    #10;

    mem_write = 0;
    mem_read = 1;

    #10;

    $finish;

end

endmodule
