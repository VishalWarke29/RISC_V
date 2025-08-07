module instruction_memory (
    input [31:0] address,
    output [31:0] instruction
);

reg [31:0] mem [0:255];

initial begin
    // Sample program
    mem[0] = 32'h00000013; // NOP (ADDI x0, x0, 0)
    mem[1] = 32'h00100093; // ADDI x1, x0, 1
    mem[2] = 32'h00200113; // ADDI x2, x0, 2
    mem[3] = 32'h00308193; // ADDI x3, x1, 3
end

assign instruction = mem[address[9:2]]; // Word aligned

endmodule