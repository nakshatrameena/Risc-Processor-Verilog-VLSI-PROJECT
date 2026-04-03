// Code your design here
// ===== ALU =====
module ALU (
    input [31:0] A, B,
    input [2:0] alu_ctrl,
    output reg [31:0] result
);
always @(*) begin
    case (alu_ctrl)
        3'b000: result = A + B;
        3'b001: result = A - B;
        3'b010: result = A & B;
        3'b011: result = A | B;
        default: result = 0;
    endcase
end
endmodule


// ===== Control Unit =====
module ControlUnit (
    input [2:0] opcode,
    output reg reg_write,
    output reg [2:0] alu_ctrl
);
always @(*) begin
    case (opcode)
        3'b000: begin reg_write = 1; alu_ctrl = 3'b000; end
        3'b001: begin reg_write = 1; alu_ctrl = 3'b001; end
        3'b010: begin reg_write = 1; alu_ctrl = 3'b010; end
        3'b011: begin reg_write = 1; alu_ctrl = 3'b011; end
        default: begin reg_write = 0; alu_ctrl = 3'b000; end
    endcase
end
endmodule


// ===== Register File =====
module RegisterFile (
    input clk,
    input [4:0] rs1, rs2, rd,
    input [31:0] write_data,
    input reg_write,
    output [31:0] read_data1, read_data2
);
reg [31:0] registers [0:31];
integer i;

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


// ===== Program Counter =====
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


// ===== Instruction Memory =====
module InstructionMemory (
    input [31:0] addr,
    output [31:0] instruction
);
reg [31:0] memory [0:15];
integer i;

initial begin
    memory[0] = {3'b000,5'd1,5'd2,5'd3,14'd0};
    memory[1] = {3'b001,5'd1,5'd2,5'd4,14'd0};
    memory[2] = {3'b010,5'd1,5'd2,5'd5,14'd0};
    memory[3] = {3'b011,5'd1,5'd2,5'd6,14'd0};
    for (i=4; i<16; i=i+1) memory[i]=0;
end

assign instruction = memory[addr[5:2]];
endmodule


// ===== Top Module =====
module TopModule(input clk);

wire [31:0] pc, instruction;
wire [4:0] rs1, rs2, rd;
wire [2:0] opcode;
wire [31:0] read_data1, read_data2;
wire [31:0] alu_result;
wire reg_write;
wire [2:0] alu_ctrl;

assign opcode = instruction[31:29];
assign rs1    = instruction[28:24];
assign rs2    = instruction[23:19];
assign rd     = instruction[18:14];

ProgramCounter PC(clk, pc);
InstructionMemory IM(pc, instruction);

RegisterFile RF(clk, rs1, rs2, rd, alu_result, reg_write, read_data1, read_data2);
ControlUnit CU(opcode, reg_write, alu_ctrl);
ALU alu(read_data1, read_data2, alu_ctrl, alu_result);

endmodule