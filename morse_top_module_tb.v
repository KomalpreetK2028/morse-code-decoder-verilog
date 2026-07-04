`timescale 1ns/1ps

module top_module_tb;

reg clk;
reg areset;
reg key;

wire [7:0] ascii;

top_module uut (
    .clk(clk),
    .areset(areset),
    .key(key),
    .ascii(ascii)
);

// Clock Generation
always #5 clk = ~clk;

initial begin
    clk = 0;
    areset = 1;
    key = 0;

    #20;
    areset = 0;

    // A (.-)
    key = 1;
    repeat(5) @(posedge clk);
    key = 0;
    repeat(10) @(posedge clk);

    key = 1;
    repeat(15) @(posedge clk);
    key = 0;
    repeat(35) @(posedge clk);

    repeat(20) @(posedge clk);

    // T (-)
    key = 1;
    repeat(15) @(posedge clk);
    key = 0;
    repeat(35) @(posedge clk);

    // S (...)
    key = 1;
    repeat(5) @(posedge clk);
    key = 0;
    repeat(10) @(posedge clk);

    key = 1;
    repeat(5) @(posedge clk);
    key = 0;
    repeat(10) @(posedge clk);

    key = 1;
    repeat(5) @(posedge clk);
    key = 0;
    repeat(35) @(posedge clk);

    // 5 (.....)
    key = 1;
    repeat(5) @(posedge clk);
    key = 0;
    repeat(10) @(posedge clk);

    key = 1;
    repeat(5) @(posedge clk);
    key = 0;
    repeat(10) @(posedge clk);

    key = 1;
    repeat(5) @(posedge clk);
    key = 0;
    repeat(10) @(posedge clk);

    key = 1;
    repeat(5) @(posedge clk);
    key = 0;
    repeat(10) @(posedge clk);

    key = 1;
    repeat(5) @(posedge clk);
    key = 0;
    repeat(35) @(posedge clk);

    // ? (..--..)
    key = 1;
    repeat(5) @(posedge clk);
    key = 0;
    repeat(10) @(posedge clk);

    key = 1;
    repeat(5) @(posedge clk);
    key = 0;
    repeat(10) @(posedge clk);

    key = 1;
    repeat(15) @(posedge clk);
    key = 0;
    repeat(10) @(posedge clk);

    key = 1;
    repeat(15) @(posedge clk);
    key = 0;
    repeat(10) @(posedge clk);

    key = 1;
    repeat(5) @(posedge clk);
    key = 0;
    repeat(10) @(posedge clk);

    key = 1;
    repeat(5) @(posedge clk);
    key = 0;
    repeat(35) @(posedge clk);

    // HI
    // H (....)
    key = 1;
    repeat(5) @(posedge clk);
    key = 0;
    repeat(10) @(posedge clk);

    key = 1;
    repeat(5) @(posedge clk);
    key = 0;
    repeat(10) @(posedge clk);

    key = 1;
    repeat(5) @(posedge clk);
    key = 0;
    repeat(10) @(posedge clk);

    key = 1;
    repeat(5) @(posedge clk);
    key = 0;
    repeat(35) @(posedge clk);

    // I (..)
    key = 1;
    repeat(5) @(posedge clk);
    key = 0;
    repeat(10) @(posedge clk);

    key = 1;
    repeat(5) @(posedge clk);
    key = 0;
    repeat(35) @(posedge clk);

    $finish;
end

initial begin
    $dumpfile("morse.vcd");
    $dumpvars(0, top_module_tb);

    $monitor("time=%0t key=%b ascii=%c",
             $time, key, ascii);
end

endmodule