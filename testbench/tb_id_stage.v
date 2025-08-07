`timescale 1ns/1ps

module tb_id_stage;

reg clk;
reg reg_write;
reg [31:0] instruction;
reg [4:0] write_reg;
reg [31:0] write_data;

wire [4:0] rs1, rs2, rd;
wire [31:0] operand1, operand2;

// Instantiate decode stage
id_stage uut (
    .instruction(instruction),
    .clk(clk),
    .reg_write(reg_write),
    .write_data(write_data),
    .write_reg(write_reg),
    .rs1(rs1),
    .rs2(rs2),
    .rd(rd),
    .operand1(operand1),
    .operand2(operand2)
);

// Clock
always #5 clk = ~clk;

initial begin
    $display("Time\tInstruction\t\t rs1\trs2\trd\tOp1\t\tOp2");
    $monitor("%g\t%h\t %d\t%d\t%d\t%h\t%h", 
        $time, instruction, rs1, rs2, rd, operand1, operand2);

    clk = 0;
    reg_write = 0;
    instruction = 32'b00000000000100010000000110110011; // Example R-type: ADD x3, x2, x1

    // Initialize register x1 and x2 manually
    reg_write = 1;
    write_reg = 5'd1;
    write_data = 32'd10;
    #10;

    write_reg = 5'd2;
    write_data = 32'd20;
    #10;

    reg_write = 0;
    instruction = 32'b00000000001000001000000110110011; // ADD x3, x1, x2
    #20;

    $finish;
end

endmodule