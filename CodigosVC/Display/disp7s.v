module disp7s(
    output wire Fa,Fb,Fc,Fd,Fe,Ff,Fg,
    input wire A,B,C
    );
  assign    Fa=(~A & ~C)|(B)|(A & C);
    assign  Fb=(~B & ~C)|(~A)|(B & C);
    assign  Fc=(A)|(~B)|(C);
    assign  Fd=(~A & ~C) | (~A & B) | (B & ~C)|(A & ~B & C);
    assign  Fe=(~A & ~C) | (B & ~C);
    assign  Ff=(~B & ~C) | (A & ~C) | (A & ~B);
    assign  Fg=(~A & B)  |  (A & ~C)  | (A & ~B);
endmodule