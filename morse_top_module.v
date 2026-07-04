module top_module (
    input clk,
    input areset,
    input key,
    output [7:0] ascii
);

wire [7:0] press_duration;
wire [7:0] gap_duration;

wire symbol;
wire valid;

wire [6:0] pattern;
wire [2:0] length;

wire press_enable;
wire press_clear;
wire gap_enable;
wire gap_clear;
wire press_end;
wire letter_done;
wire word_done;
wire clear;

morse_fsm inst1 (
    .clk(clk),
    .areset(areset),
    .key(key),
    .gap_duration(gap_duration),
    .press_en(press_enable),
    .press_clr(press_clear),
    .gap_en(gap_enable),
    .gap_clr(gap_clear),
    .letter_done(letter_done),
    .word_done(word_done),
    .clear(clear),
    .press_end(press_end)
);

press_counter inst2 (
    .clk(clk),
    .areset(areset),
    .enable(press_enable),
    .clear(press_clear),
    .press_duration(press_duration)
);

gap_counter inst3 (
    .clk(clk),
    .areset(areset),
    .enable(gap_enable),
    .clear(gap_clear),
    .gap_duration(gap_duration)
);

dot_dash_detector inst4 (
    .clk(clk),
    .areset(areset),
    .press_duration(press_duration),
    .press_end(press_end),
    .symbol(symbol),
    .valid(valid)
);

symbol_register inst5 (
    .clk(clk),
    .areset(areset),
    .valid(valid),
    .clear(clear),
    .symbol(symbol),
    .pattern(pattern),
    .length(length)
);

morse_decoder inst6 (
    .pattern(pattern),
    .length(length),
    .ascii(ascii)
);

endmodule
