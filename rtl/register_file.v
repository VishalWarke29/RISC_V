module register_file(
    input clk,
    input reg_write,                      // Write enable
    input [4:0] rs1, rs2, rd,             // Register addresses
    input [31:0] write_data,             // Data to write
    output [31:0] read_data1, read_data2 // Data read from rs1 and rs2
);

reg [31:0] regs[0:31]; // 32 registers

// Read from rs1 and rs2
assign read_data1 = (rs1 != 0) ? regs[rs1] : 0; // x0 is always 0
assign read_data2 = (rs2 != 0) ? regs[rs2] : 0;

// Write to rd
always @(posedge clk) begin
    if (reg_write && rd != 0)
        regs[rd] <= write_data;
end

endmodule