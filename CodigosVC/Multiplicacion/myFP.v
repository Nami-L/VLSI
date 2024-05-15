`timescale 1ns/1ps //escala de tiempo recomendado
module myF_TB (); //no entradas ni saludas ambiente para probar el circuito
  reg[2:0] X_TB;//recibir entradas vector
wire F_TB;//recibir salidas
  
  myF DUT (.F(F_TB), .A(X_TB[2]), .B(X_TB[1]), .C(X_TB[0]));//definir el mapeo .puerto[alambre]
initial
begin
     	X_TB=3'b000;
	#10 X_TB=3'b001;
  #10 X_TB=3'b010;
  #10 X_TB=3'b011;
  #10 X_TB=3'b100;
  #10 X_TB=3'b101;
  #10 X_TB=3'b110;
  #10 X_TB=3'b111;
  #10 X_TB=3'b000;
  
end
  initial begin //vaciar las señales y pasarlas al .vcd para que el editor genere las señales.
    $dumpvars;
    $dumfile("dump.vcd");
    end
endmodule

