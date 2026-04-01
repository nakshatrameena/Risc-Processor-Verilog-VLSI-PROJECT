module DataMemory (
    input clk,
    input [31:0] addr,
    input [31:0] write_data,
    input mem_write,
    output [31:0] read_data
);

reg [31:0] memory [0:15];

assign read_data = memory[addr[5:2]];

always @(posedge clk) begin
    if (mem_write)
        memory[addr[5:2]] <= write_data;
end

endmodule