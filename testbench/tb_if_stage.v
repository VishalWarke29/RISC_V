`timescale 1ns / 1ps

module tb_if_stage;

reg clk;
reg reset;
wire [31:0] pc_out;
wire [31:0] instruction;

// Instantiate the IF stage
if_stage uut (
    .clk(clk),
    .reset(reset),
    .pc_out(pc_out),
    .instruction(instruction)
);

// Clock generator
always #5 clk = ~clk;

initial begin
    $display("Time\tPC\t\tInstruction");
    $monitor("%g\t%h\t%h", $time, pc_out, instruction);

    clk = 0;
    reset = 1;

    #10 reset = 0;

    #50 $finish;
end

endmodule