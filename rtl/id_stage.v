module id_stage(
    input [31:0] instruction,
    input clk,
    input reg_write,
    input [31:0] write_data,
    input [4:0] write_reg,
    output [4:0] rs1, rs2, rd,
    output [31:0] operand1, operand2
);

// Extract fields from instruction (R-type or I-type simplified)
assign rs1 = instruction[19:15];
assign rs2 = instruction[24:20];
assign rd  = instruction[11:7];

// Register file
register_file rf (
    .clk(clk),
    .reg_write(reg_write),
    .rs1(rs1),
    .rs2(rs2),
    .rd(write_reg),
    .write_data(write_data),
    .read_data1(operand1),
    .read_data2(operand2)
);

endmodule