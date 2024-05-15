`timescale 1ns/1ps
module comb01_TB ();
    reg [2:0] X_TB;
    wire F_TB;
    integer i;
    reg [2:0] TstVectors[7:0];
comb01 DUT (.F(F_TB), .X(X_TB));
initial
begin
    $readmemb("DataIn.txt", TstVectors);
    $display("Vector  |  F");
   for (i=0; i <8; i=i+1)
   begin
     X_TB = TstVectors[i];
     #10 $display("%b  |   %b", X_TB,F_TB);   
   end
end 
  initial begin
    $dumpvars;
    $dumpfile("dump.vcd");
  end
endmodule
