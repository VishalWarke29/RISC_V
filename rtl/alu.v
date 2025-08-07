module alu (
    input [3:0] alu_control,       // Operation selector
    input [31:0] operand1, operand2,
    output reg [31:0] result
);

// ALU operation codes (basic examples)
parameter ADD = 4'b0000;
parameter SUB = 4'b0001;
parameter AND = 4'b0010;
parameter OR  = 4'b0011;

always @(*) begin
    case (alu_control)
        ADD: result = operand1 + operand2;
        SUB: result = operand1 - operand2;
        AND: result = operand1 & operand2;
        OR:  result = operand1 | operand2;
        default: result = 0;
    endcase
end

endmodule