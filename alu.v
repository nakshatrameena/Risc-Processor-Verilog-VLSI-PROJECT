module ALU (
    input [31:0] A, B,
    input [2:0] alu_ctrl,
    output reg [31:0] result
);

always @(*) begin
    case (alu_ctrl)
        3'b000: result = A + B; // ADD
        3'b001: result = A - B; // SUB
        3'b010: result = A & B; // AND
        3'b011: result = A | B; // OR
        default: result = 0;
    endcase
end

endmodule