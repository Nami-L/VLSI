`timescale 1ns/1ns
module ALU181_TB ();
  reg [7:0] A_TB, B_TB;
  reg       M_TB, Cn_TB;
  reg [3:0] Sel_TB;
  wire [7:0] F_TB;
  ALU181 DUT (.A(A_TB), .B(B_TB), .M(M_TB), .Cn(Cn_TB), .Sel(Sel_TB), .F(F_TB));
initial
begin
    A_TB    = 8'h85;
    B_TB    = 8'hAA;
    M_TB 	= 1'b0;
    Cn_TB 	= 1'b0;
        Sel_TB = 4'b1111;         
    #10 Sel_TB = 4'b0001;
    #10 Sel_TB = 4'b1011;
    #10 Sel_TB = 4'b0000;
  
    #10 M_TB =1'b1;
    #10 Sel_TB = 4'b1011;
    #10 Sel_TB = 4'b1111;
    #10 Sel_TB = 4'b1000;
 /*    */
   #10;    
end
/**/
 initial begin
    $dumpvars;
    $dumpfile("dump.vcd");
  end
  
endmodule