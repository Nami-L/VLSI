`timescale 1ns/1ps
module comb01_TB ();
    reg [2:0] X_TB;
    wire F_TB;
    integer i;
comb01 DUT (.F(F_TB), .X(X_TB));
initial
begin
   for (i=0; i <8; i=i+1)
   begin
     X_TB = i;
     #10 $display("X_TB=%b  F_TB=%b", X_TB,F_TB);
   end
end 
  initial begin
    $dumpvars;
    $dumpfile("dump.vcd");
  end
endmodule
