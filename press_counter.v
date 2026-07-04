module press_counter(
    input clk,
    input areset,
    input enable,
    input clear,
    output reg [7:0] press_duration
);
always @(posedge clk or posedge areset)
begin
    if (areset)
    press_duration <= 8'h00;
    else if (clear)
    press_duration <= 8'h00;
    else if (enable) begin
        press_duration <= press_duration+8'd1;
    end
end
endmodule