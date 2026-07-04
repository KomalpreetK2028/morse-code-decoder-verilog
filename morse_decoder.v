module morse_decoder(
    input [6:0] pattern,
    input [2:0] length,
    output reg [7:0] ascii
);
always @(*)
begin
    ascii = 8'h58;
    //letters A-Z/a-z
    if (length == 3'd1) begin
        casez (pattern)
        7'b??????0 : ascii = 8'h45;
        7'b??????1 : ascii = 8'h54;
        default: ascii = "X";
        endcase
    end
    else if(length == 3'd2)begin
        casez (pattern)
        7'b?????00 : ascii = 8'h49;
        7'b?????01 : ascii = 8'h41;
        7'b?????10 : ascii = 8'h4E;
        7'b?????11 : ascii = 8'h4D;
        default: ascii = "X";
        endcase
    end
    else if (length == 3'd3)begin
        casez (pattern)
        7'b????000 : ascii = 8'h53;
        7'b????001 : ascii = 8'h55;
        7'b????010 : ascii = 8'h52;
        7'b????011 : ascii = 8'h57;
        7'b????100 : ascii = 8'h44;
        7'b????101 : ascii = 8'h4B;
        7'b????110 : ascii = 8'h47;
        7'b????111 : ascii = 8'h4F;
        default: ascii = "X";
        endcase
    end
    else if (length == 3'd4)begin
        casez (pattern)
        7'b???0000 : ascii = 8'h48;
        7'b???0001 : ascii = 8'h56;
        7'b???0010 : ascii = 8'h46;
        7'b???0100 : ascii = 8'h4C;
        7'b???0110 : ascii = 8'h50;
        7'b???1000 : ascii = 8'h42;
        7'b???1001 : ascii = 8'h58;
        7'b???1010 : ascii = 8'h43;
        7'b???1011 : ascii = 8'h59;
        7'b???1100 : ascii = 8'h5A;
        7'b???1101 : ascii = 8'h51;
        default: ascii = "X";
        endcase
    end
    //digits 0-9 and punctuation (&, +, =, /,()
    else if (length == 3'd5)begin
        casez (pattern)
        7'b??01111 : ascii = 8'h31;
        7'b??00111 : ascii = 8'h32;
        7'b??00011 : ascii = 8'h33;
        7'b??00001 : ascii = 8'h34;
        7'b??00000 : ascii = 8'h35;
        7'b??10000 : ascii = 8'h36;
        7'b??11000 : ascii = 8'h37;
        7'b??11100 : ascii = 8'h38;
        7'b??11110 : ascii = 8'h39;
        7'b??11111 : ascii = 8'h30;
        7'b??01000 : ascii = 8'h26;
        7'b??01010 : ascii = 8'h2B;
        7'b??10001 : ascii = 8'h3D;
        7'b??10010 : ascii = 8'h2F;
        7'b??10110 : ascii = 8'h28;
        default: ascii = "X";
        endcase
    end
    //remaining punctuation
    else if (length == 3'd6) begin
    casez (pattern)
        7'b?010101 : ascii = 8'h2E;
        7'b?110011 : ascii = 8'h2C;
        7'b?001100 : ascii = 8'h3F;
        7'b?011110 : ascii = 8'h27;
        7'b?101011 : ascii = 8'h21;
        7'b?101101 : ascii = 8'h29;
        7'b?111000 : ascii = 8'h3A;
        7'b?101010 : ascii = 8'h3B;
        7'b?100001 : ascii = 8'h2D;
        7'b?001101 : ascii = 8'h5F;
        7'b?010010 : ascii = 8'h22;
        7'b?011010 : ascii = 8'h40;
        default: ascii = "X";
    endcase
end
else if (length == 3'd7) begin
    casez (pattern)
        7'b0001001 : ascii = 8'h24;
        default: ascii = "X";
    endcase
end
end
endmodule