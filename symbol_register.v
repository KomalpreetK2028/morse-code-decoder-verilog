module symbol_register (
    input clk,
    input areset,
    input valid,
    input clear,
    input symbol,
    output reg [6:0] pattern,
    output reg [2:0] length
);
always @(posedge clk or posedge areset) begin
    if (areset) begin
        pattern <= 7'd0;
        length  <= 3'd0;
    end
    else if (clear) begin
        pattern <= 7'd0;
        length  <= 3'd0;
    end
    else if (valid) begin
        pattern[6:1] <= pattern[5:0];
        pattern[0] <= symbol;
        length <= length + 3'd1;
    end
end

endmodule


