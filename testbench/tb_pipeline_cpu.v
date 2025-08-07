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
    $display("Time\tClock\tPC");
    clk = 0;
    reset = 1;
    #10 reset = 0;
    #100 $finish;
end

endmodule