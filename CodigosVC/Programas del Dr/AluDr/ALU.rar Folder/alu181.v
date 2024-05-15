module ALU181 (
    input   [7:0]    A, B,
    input   [5:0]    Sel,
    output  [7:0]    F
//        output  [7:0]    Flags
);
reg [7:0] outALU;
always @(*) begin    
  case (Sel)
    6'b00_0000:    
        outALU = A - 1;
    6'b00_0001:    
      outALU = (A & B) -1;
    6'b00_1011,
    6'b10_1011:    
        outALU = A | B;
    6'b00_1111,
    6'b10_1111:    
        outALU = A;
    default:
        outALU = B;
    endcase
end
assign F = outALU;
//assign Flags = {};
endmodule