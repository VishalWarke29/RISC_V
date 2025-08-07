module pipeline_cpu (
    input clk,
    input reset
);

wire [31:0] pc, instr;
wire [4:0] rs1, rs2, rd;
wire [31:0] op1, op2;
wire [31:0] alu_result;
wire [6:0] opcode;
wire [2:0] funct3;
wire [6:0] funct7;

// EX → MEM
wire [31:0] ex_alu_result;
wire [4:0] ex_rd;

// MEM → WB
wire [31:0] mem_alu_result;
wire [4:0] mem_rd;

// WB outputs
wire [31:0] wb_result;
wire [4:0] wb_rd;
wire wb_reg_write;

// IF
if_stage if_stage_inst (
    .clk(clk),
    .reset(reset),
    .pc_out(pc),
    .instruction(instr)
);

// ID
id_stage id_stage_inst (
    .instruction(instr),
    .clk(clk),
    .reg_write(0), // No WB yet
    .write_data(32'b0),
    .write_reg(5'b0),
    .rs1(rs1),
    .rs2(rs2),
    .rd(rd),
    .operand1(op1),
    .operand2(op2)
);

// Extract opcode, funct3, funct7
assign opcode = instr[6:0];
assign funct3 = instr[14:12];
assign funct7 = instr[31:25];

// Pipeline registers
wire [31:0] id_pc, id_instr;
wire [31:0] ex_op1, ex_op2;
wire [4:0] ex_rs1, ex_rs2, ex_rd;
wire [6:0] ex_opcode;
wire [2:0] ex_funct3;
wire [6:0] ex_funct7;

pipeline_registers pipe_regs (
    .clk(clk),
    .reset(reset),

    .if_pc_in(pc),
    .if_instr_in(instr),
    .id_pc_out(id_pc),
    .id_instr_out(id_instr),

    .id_op1_in(op1),
    .id_op2_in(op2),
    .id_rs1_in(rs1),
    .id_rs2_in(rs2),
    .id_rd_in(rd),
    .id_opcode_in(opcode),
    .id_funct3_in(funct3),
    .id_funct7_in(funct7),

    .ex_op1_out(ex_op1),
    .ex_op2_out(ex_op2),
    .ex_rs1_out(ex_rs1),
    .ex_rs2_out(ex_rs2),
    .ex_rd_out(ex_rd),
    .ex_opcode_out(ex_opcode),
    .ex_funct3_out(ex_funct3),
    .ex_funct7_out(ex_funct7)
);

// EX
ex_stage ex_stage_inst (
    .operand1(ex_op1),
    .operand2(ex_op2),
    .opcode(ex_opcode),
    .funct3(ex_funct3),
    .funct7(ex_funct7),
    .alu_result(alu_result)
);

mem_stage mem_stage_inst (
    .alu_result_in(ex_alu_result),
    .mem_result_out(mem_alu_result)
);

wb_stage wb_stage_inst (
    .wb_result_in(mem_alu_result),
    .rd_in(mem_rd),
    .reg_write_out(wb_reg_write),
    .write_reg_out(wb_rd),
    .write_data_out(wb_result)
);

id_stage id_stage_inst (
    .instruction(instr),
    .clk(clk),
    .reg_write(wb_reg_write),
    .write_data(wb_result),
    .write_reg(wb_rd),
    .rs1(rs1),
    .rs2(rs2),
    .rd(rd),
    .operand1(op1),
    .operand2(op2)
);

endmodule