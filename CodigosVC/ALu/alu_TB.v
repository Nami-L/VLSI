`timescale 1ns/1ps
module ALU_TB ();
    reg [7:0] A,B;
    reg [3:0] opcode;
    reg m;
    reg cn;
    reg l;
    reg h;
    wire [7:0] R;
    integer i;
    integer FILE;
ALU DUT (A,B,opcode,m,cn,l,h,R);
initial
begin
      A = 4'b00000001;
      B = 4'b00000010;
      opcode = 4'b0000;
      m=1'b1;
      cn=1'b0;
      l=1'b1;
      h=1'b0;
     FILE = $fopen("DataOut.txt");
    $fdisplay(FILE, "opcode  |  R");
      for (i=0; i <=15; i=i+1)
        begin
         opcode = i;
         #9;
  
        #1 $fdisplay(FILE,"opcode=%b  R=%b", opcode,R);
       end
       $fclose(FILE);
       $finish;
end 
//$finish
endmodule