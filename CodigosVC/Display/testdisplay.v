// Code your testbench here
// or browse Examples
`timescale 1ns/1ps //escala de tiempo recomendado
module disp7s_TB (); //no entradas ni salidas ambiente para probar el circuito
  reg[2:0] X_TB;//recibir entradas vector
  wire [6:0]F_TB;//recibir salidas
  
  disp7s DUT (.Fa(F_TB[6]),.Fb(F_TB[5]),.Fc(F_TB[4]),
  .Fd(F_TB[3]),.Fe(F_TB[2]),.Ff(F_TB[1]),
  .Fg(F_TB[0]), .A(X_TB[2]), .B(X_TB[1]), 
  .C(X_TB[0]));//definir el mapeo .puerto[alambre]
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