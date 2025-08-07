`timescale 1ns/1ps

module tb_ex_stage;

reg [31:0] operand1, operand2;
reg [6:0] opcode;
reg [2:0] funct3;
reg [6:0] funct7;
wire [31:0] alu_result;

ex_stage uut (
    .operand1(operand1),
    .operand2(operand2),
    .opcode(opcode),
    .funct3(funct3),
    .funct7(funct7),
    .alu_result(alu_result)
);

initial begin
    $display("Time\tOperand1\tOperand2\tOpcode\tFunct3\tFunct7\tResult");
    $monitor("%g\t%h\t%h\t%h\t%h\t%h\t%h", 
        $time, operand1, operand2, opcode, funct3, funct7, alu_result);

    // ADD: x3 = x1 + x2
    operand1 = 32'd10;
    operand2 = 32'd20;
    opcode = 7'b0110011;
    funct3 = 3'b000;
    funct7 = 7'b0000000;
    #10;

    // SUB: x3 = x1 - x2
    operand1 = 32'd30;
    operand2 = 32'd15;
    opcode = 7'b0110011;
    funct3 = 3'b000;
    funct7 = 7'b0100000;
    #10;

    // AND
    operand1 = 32'hFF00FF00;
    operand2 = 32'h0F0F0F0F;
    funct3 = 3'b111;
    funct7 = 7'b0000000;
    #10;

    // OR
    funct3 = 3'b110;
    #10;

    $finish;
end

endmodule