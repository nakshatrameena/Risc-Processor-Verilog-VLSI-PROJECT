module RegisterFile (
    input clk,
    input [4:0] rs1, rs2, rd,
    input [31:0] write_data,
    input reg_write,
    output [31:0] read_data1, read_data2
);

reg [31:0] registers [0:31];
integer i;   // ✅ Declare OUTSIDE

assign read_data1 = registers[rs1];
assign read_data2 = registers[rs2];

initial begin
    for (i = 0; i < 32; i = i + 1)
        registers[i] = 0;

    registers[1] = 10;
    registers[2] = 5;
end

always @(posedge clk) begin
    if (reg_write)
        registers[rd] <= write_data;
end

endmodule