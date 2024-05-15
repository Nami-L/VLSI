`timescale 1ns/1ns
module ALU181_TB ();
  reg [7:0] A_TB, B_TB;
  reg [5:0] Sel_TB;
  wire [7:0] F_TB;
  ALU181 DUT (.A(A_TB), .B(B_TB), .Sel(Sel_TB), .F(F_TB));
initial
begin
    A_TB    = 8'h85;
    B_TB    = 8'hAA;
        Sel_TB = 6'b001111;
         
    #10 Sel_TB = 6'b000001;
    #10 Sel_TB = 6'b001011;
    #10 Sel_TB = 6'b000000;
  
    #10 Sel_TB = 6'b10_1011;
    #10 Sel_TB = 6'b10_1111;
    #10 Sel_TB = 6'b10_1000;
 /*    */
   #10;    
end
/**/
 initial begin
    $dumpvars;
    $dumpfile("dump.vcd");
  end
  
endmodule