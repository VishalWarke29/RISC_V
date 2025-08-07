`timescale 1ns/1ps

module tb_pipeline_cpu;

reg clk;
reg reset;

pipeline_cpu uut (
    .clk(clk),
    .reset(reset)
);

always #5 clk = ~clk;

initial begin
    $monitor("%g PC=%h | ALU=%h | WB_Reg=%d, Data=%h",
        $time, uut.pc, uut.ex_alu_result, uut.wb_rd, uut.wb_result);
        $display("Time\tClock\tPC");
        clk = 0;
        reset = 1;
        #10 reset = 0;
        #100 $finish;
end

endmodule