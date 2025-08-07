module pipeline_registers (
    input clk,
    input reset,

    // IF/ID
    input [31:0] if_pc_in,
    input [31:0] if_instr_in,
    output reg [31:0] id_pc_out,
    output reg [31:0] id_instr_out,

    // ID/EX
    input [31:0] id_op1_in,
    input [31:0] id_op2_in,
    input [4:0] id_rs1_in, id_rs2_in, id_rd_in,
    input [6:0] id_opcode_in,
    input [2:0] id_funct3_in,
    input [6:0] id_funct7_in,

    // EX/MEM
    input [31:0] ex_alu_result_in,
    input [4:0] ex_rd_in,
    output reg [31:0] mem_alu_result_out,
    output reg [4:0] mem_rd_out,

    // MEM/WB
    input [31:0] mem_result_in,
    input [4:0] mem_rd_in,
    output reg [31:0] wb_result_out,
    output reg [4:0] wb_rd_out

    output reg [31:0] ex_op1_out,
    output reg [31:0] ex_op2_out,
    output reg [4:0] ex_rs1_out, ex_rs2_out, ex_rd_out,
    output reg [6:0] ex_opcode_out,
    output reg [2:0] ex_funct3_out,
    output reg [6:0] ex_funct7_out
);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        id_pc_out <= 0;
        id_instr_out <= 0;
        ex_op1_out <= 0;
        ex_op2_out <= 0;
        ex_rs1_out <= 0;
        ex_rs2_out <= 0;
        ex_rd_out <= 0;
        ex_opcode_out <= 0;
        ex_funct3_out <= 0;
        ex_funct7_out <= 0;
    end else begin
        // IF/ID
        id_pc_out <= if_pc_in;
        id_instr_out <= if_instr_in;

        // ID/EX
        ex_op1_out <= id_op1_in;
        ex_op2_out <= id_op2_in;
        ex_rs1_out <= id_rs1_in;
        ex_rs2_out <= id_rs2_in;
        ex_rd_out <= id_rd_in;
        ex_opcode_out <= id_opcode_in;
        ex_funct3_out <= id_funct3_in;
        ex_funct7_out <= id_funct7_in;

        // EX/MEM
        mem_alu_result_out <= ex_alu_result_in;
        mem_rd_out <= ex_rd_in;

        // MEM/WB
        wb_result_out <= mem_result_in;
        wb_rd_out <= mem_rd_in;
    end
end

endmodule