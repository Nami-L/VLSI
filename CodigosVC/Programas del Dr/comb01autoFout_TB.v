`timescale 1ns/1ps
module comb01_TB ();
    reg [2:0] X_TB;//entrada calculada del programa
    reg [2:0] datoin;// Entrad esperada a de 3 vectores porque tiene 3 bits de entrada ABC
    reg datosal; // Salida Esperada1 bit porque solo tiene F como salida
    reg [2:0] Vector_in[7:0];  // 7 bits por las combinaciones
  	reg  Vector_out[7:0];// 7 bits por las combinaciones
    wire F_TB;//salida calculada del programa
    integer i;//iteracion
    integer FILE;//archivo
comb01 DUT (.F(F_TB), .X(X_TB));
initial
begin
  $readmemb("DataIn.txt", Vector_in);//Leer el bloc de entradas esperadas
  $readmemb("DataOut.txt", Vector_out);//Leer el bloc de salidas esperadas
  FILE = $fopen("Final.txt");//nombrar al archivo
  $fdisplay(FILE, "|Entrada C|Entrada E|Salida C|Salida E|");//
    for (i=0; i <8; i=i+1)//cilo de 0- 7 por las combinaciones
   begin
     X_TB = i;// variable incial
     datoin = Vector_in[i];// misma variable de para que empiecen
     datosal = Vector_out[i];//tanto entradas como salidas
     #10;
     if (datoin == X_TB & datosal == F_TB)//comparamos las E/S esperadas y calculadas
     #1 $fdisplay(FILE,"|  %b  |  %b  |  %b  |  %b  |CORRECT", X_TB,datoin,F_TB,datosal);  
     else
     #1 $fdisplay(FILE,"|  %b  |  %b  |  %b  |  %b  |FAIL", X_TB,datoin,F_TB,datosal);  
   end
   $fclose(FILE);
end 
 
endmodule
