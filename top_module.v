module TopModule(input clk);

// Wires
wire [31:0] pc, instruction;
wire [4:0] rs1, rs2, rd;
wire [2:0] opcode;
wire [31:0] read_data1, read_data2;
wire [31:0] alu_result;
wire reg_write;
wire [2:0] alu_ctrl;

// Extract fields
assign opcode = instruction[31:29];
assign rs1    = instruction[28:24];
assign rs2    = instruction[23:19];
assign rd     = instruction[18:14];

// Modules
ProgramCounter PC(clk, pc);
InstructionMemory IM(pc, instruction);

RegisterFile RF(
    clk, rs1, rs2, rd,
    alu_result,
    reg_write,
    read_data1, read_data2
);

ControlUnit CU(opcode, reg_write, alu_ctrl);

ALU alu(
    read_data1,
    read_data2,
    alu_ctrl,
    alu_result
);

endmodule