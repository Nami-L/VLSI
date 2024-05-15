`timescale 1ns/1ps
module comb01_TB ();
    reg [2:0] X_TB;
    wire F_TB;

comb01 DUT (.F(F_TB), .X(X_TB));
initial
begin
        X_TB = 3'b000;
    #10 X_TB = 3'b001;
    #10 X_TB = 3'b010;
    #10 X_TB = 3'b011;
    #10 X_TB = 3'b100;
    #10 X_TB = 3'b101;
    #10 X_TB = 3'b110;
    #10 X_TB = 3'b111;
    #10 X_TB = 3'b000;
end 
  initial begin
    $dumpvars;
    $dumpfile("dump.vcd");
  end
endmodule
/*
`timescale 1ns/1ps
module comb01_TB ();
    reg [2:0] X_TB;
    wire F_TB;
    integer FILE;

comb01 DUT (.F(F_TB), .X(X_TB));
initial
begin
FILE=$fopen("Data_Out.txt");
                            $fdisplay(FILE, "X | F");
        X_TB = 3'b000;     #1 $fdisplay(FILE, "%b | %b",X_TB,F_TB);
    #10 X_TB = 3'b001;   #1   $fdisplay(FILE, "%b | %b",X_TB,F_TB);
    #10 X_TB = 3'b010;    #1  $fdisplay(FILE, "%b | %b",X_TB,F_TB);
    #10 X_TB = 3'b011;     #1 $fdisplay(FILE, "%b | %b",X_TB,F_TB);
    #10 X_TB = 3'b100;      #1$fdisplay(FILE, "%b | %b",X_TB,F_TB);
    #10 X_TB = 3'b101;    #1  $fdisplay(FILE, "%b | %b",X_TB,F_TB);
    #10 X_TB = 3'b110;     #1 $fdisplay(FILE, "%b | %b",X_TB,F_TB);
    #10 X_TB = 3'b111;     #1 $fdisplay(FILE, "%b | %b",X_TB,F_TB);
    #10 X_TB = 3'b000;     #1 $fdisplay(FILE, "%b | %b",X_TB,F_TB);
    $fclose(FILE);
end 
endmodule
*/