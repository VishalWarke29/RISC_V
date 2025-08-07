module mem_stage (
    input [31:0] alu_result_in,
    output [31:0] mem_result_out
);

// For now, we pass the ALU result forward
assign mem_result_out = alu_result_in;

endmodule