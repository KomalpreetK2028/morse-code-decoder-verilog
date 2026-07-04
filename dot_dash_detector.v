module dot_dash_detector (
    input clk,
    input areset,
    input [7:0] press_duration,
    input press_end,
    output reg symbol,
    output reg valid
);
parameter DOT_THRESHOLD = 10;
always @(posedge clk or posedge areset)
begin
    if (areset)begin
        symbol <= 1'b0;
        valid <= 1'b0;
    end
    else if (press_end) begin
        if (press_duration < DOT_THRESHOLD)begin
            symbol <= 1'b0;
            valid <= 1'b1;
        end
        else begin
            symbol <= 1'b1;
            valid <= 1'b1;
        end
    end
     else valid <= 1'b0;
end
endmodule
