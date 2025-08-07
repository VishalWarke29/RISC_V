module if_stage (
    input clk,
    input reset,
    output [31:0] pc_out,
    output [31:0] instruction
);

pc PC (
    .clk(clk),
    .reset(reset),
    .pc_out(pc_out)
);

instruction_memory IMEM (
    .address(pc_out),
    .instruction(instruction)
);

endmodule