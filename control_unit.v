module ControlUnit (
    input [2:0] opcode,
    output reg reg_write,
    output reg [2:0] alu_ctrl
);

always @(*) begin
    case (opcode)
        3'b000: begin reg_write = 1; alu_ctrl = 3'b000; end // ADD
        3'b001: begin reg_write = 1; alu_ctrl = 3'b001; end // SUB
        3'b010: begin reg_write = 1; alu_ctrl = 3'b010; end // AND
        3'b011: begin reg_write = 1; alu_ctrl = 3'b011; end // OR
        default: begin reg_write = 0; alu_ctrl = 3'b000; end
    endcase
end

endmodule