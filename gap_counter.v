module gap_counter(
    input clk,
    input areset,
    input enable,
    input clear,
    output reg [7:0] gap_duration
);

always @(posedge clk or posedge areset) begin
    if (areset)
        gap_duration <= 8'd0;
    else if (clear)
        gap_duration <= 8'd0;
    else if (enable)
        gap_duration <= gap_duration + 8'd1;
end

endmodule
