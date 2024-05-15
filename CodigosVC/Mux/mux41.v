module mux4to1(
    output wire F,
    input wire A,B,C,D,
    input wire [1:0] sel);
    assign F= (sel==2'b00) ? A:
              (sel==2'b01) ? B:
              (sel==2'b10) ? C:
              (sel==2'b11) ? D:
              1'bX;
endmodule