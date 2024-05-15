`timescale 1ns/1ps //escala de tiempo recomendado
module myF_TB (); //no entradas ni saludas ambiente para probar el circuito
  reg[3:0] X_TB;//recibir entradas vector
wire F_TB;//recibir salidas
  
  myF DUT (.F(F_TB), .A(X_TB[2]), .B(X_TB[1]), .C(X_TB[0]), .D(X_TB));//definir el mapeo .puerto[alambre]
initial
begin
      X_TB=4'b0000;
  #10 X_TB=4'b0001;
  #10 X_TB=4'b0010;
  #10 X_TB=4'b0011;
  #10 X_TB=4'b0100;
  #10 X_TB=4'b0101;
  #10 X_TB=4'b0110;
  #10 X_TB=4'b0111;
  #10 X_TB=4'b1001;
  #10 X_TB=4'b1010;
  #10 X_TB=4'b1011;
  #10 X_TB=4'b1100;
  #10 X_TB=4'b1101;
  #10 X_TB=4'b1110;
  #10 X_TB=4'b1111;
  #10 X_TB=4'b1000;
  #10 X_TB=4'b0000;
  
end
  initial begin //vaciar las señales y pasarlas al .vcd para que el editor genere las señales.
    $dumpvars;
    $dumfile("dump.vcd");
    end
endmodule
