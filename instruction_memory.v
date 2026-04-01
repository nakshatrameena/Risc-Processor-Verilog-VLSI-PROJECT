module InstructionMemory (
    input [31:0] addr,
    output [31:0] instruction
);

reg [31:0] memory [0:15];
integer i;   // ✅ Declare OUTSIDE

initial begin
    memory[0] = {3'b000, 5'd1, 5'd2, 5'd3, 14'd0}; // ADD R3 = R1 + R2
    memory[1] = {3'b001, 5'd1, 5'd2, 5'd4, 14'd0}; // SUB
    memory[2] = {3'b010, 5'd1, 5'd2, 5'd5, 14'd0}; // AND
    memory[3] = {3'b011, 5'd1, 5'd2, 5'd6, 14'd0}; // OR

    for (i = 4; i < 16; i = i + 1)
        memory[i] = 0;
end

assign instruction = memory[addr[5:2]];

endmodule