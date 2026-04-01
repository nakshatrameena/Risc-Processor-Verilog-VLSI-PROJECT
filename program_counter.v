module ProgramCounter (
    input clk,
    output reg [31:0] pc
);

initial pc = 0;

always @(posedge clk) begin
    if (pc < 16)
        pc <= pc + 4;
end

endmodule