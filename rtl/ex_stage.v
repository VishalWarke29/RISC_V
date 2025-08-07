module ex_stage (
    input [31:0] operand1,
    input [31:0] operand2,
    input [6:0] opcode,       // From instruction
    input [2:0] funct3,       // Used for ALU control
    input [6:0] funct7,       // Used for R-type ALU ops
    output [31:0] alu_result
);

wire [3:0] alu_control;

// Simple ALU control logic
assign alu_control = (opcode == 7'b0110011) ? // R-type
                    (funct3 == 3'b000 && funct7 == 7'b0100000 ? 4'b0001 : // SUB
                     funct3 == 3'b000 ? 4'b0000 : // ADD
                     funct3 == 3'b111 ? 4'b0010 : // AND
                     funct3 == 3'b110 ? 4'b0011 : // OR
                     4'b0000) :
                    4'b0000; // Default to ADD for now

alu alu_unit (
    .alu_control(alu_control),
    .operand1(operand1),
    .operand2(operand2),
    .result(alu_result)
);

endmodule