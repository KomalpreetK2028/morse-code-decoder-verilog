module morse_fsm(
    input clk,
    input areset,
    input key,
    input [7:0] gap_duration,
    output reg press_en,
    output reg press_clr,
    output reg gap_en,
    output reg gap_clr,
    output reg letter_done,
    output reg word_done,
    output reg clear,
    output reg press_end
);   
parameter LETTER_GAP = 30;
parameter WORD_GAP = 70;

parameter GAP = 1'b0, PRESS = 1'b1;
reg state, next_state;
always @(posedge clk or posedge areset)
begin
    if (areset) state <= GAP;
    else state <= next_state;
end
always @(*)
begin
    case (state)
    GAP : next_state = key ? PRESS : GAP;
    PRESS : next_state = key ? PRESS : GAP;
    default : next_state = GAP;
    endcase
end
always @(*)
begin
    press_en = 1'b0;
    gap_en = 1'b0;
    press_clr = 1'b0;
    gap_clr = 1'b0;
    letter_done = 1'b0;
    word_done = 1'b0;
    clear = 1'b0;
    press_end = 1'b0;
    case (state)
    GAP : begin
        gap_en = 1'b1;
        if (key) begin
            gap_clr = 1'b1;
            if (gap_duration >= LETTER_GAP && gap_duration <WORD_GAP)begin
            letter_done = 1'b1;
            clear = 1'b1;
            end
            else if (gap_duration >= WORD_GAP) begin word_done = 1'b1;clear = 1'b1;
        end 
    end
        end
        
    PRESS : begin
        press_en = 1'b1;
        gap_en = 1'b0;
        if (!key) begin
            press_clr = 1'b1;
            press_end = 1'b1;
        end  
    end
    endcase
end

endmodule