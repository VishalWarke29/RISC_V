module pc (
    input clk,
    input reset,
    output reg [31:0] pc_out
);

always @(posedge clk or posedge reset) begin
    if (reset)
        pc_out <= 0;
    else
        pc_out <= pc_out + 4; // RISC-V instructions are 4 bytes
end

endmodule