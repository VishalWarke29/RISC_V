module wb_stage (
    input [31:0] wb_result_in,
    input [4:0] rd_in,
    output reg_write_out,
    output [4:0] write_reg_out,
    output [31:0] write_data_out
);

assign reg_write_out = 1'b1; // Always write for now
assign write_reg_out = rd_in;
assign write_data_out = wb_result_in;

endmodule