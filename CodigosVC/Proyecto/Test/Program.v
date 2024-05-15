`timescale 1ns/100ps //escala de tiempo recomendado
module programMemory_TB (); //no entradas ni salidas ambiente para probar el circuito
reg[8:0] pc_bus;//recibir entradas vector
wire [11:0] program_bus;//recibir salida final
integer FILE;

pic10_program_memory pm  (.pc_bus(pc_bus),.program_bus(program_bus));
initial
begin
     FILE = $fopen("DataOut.txt");
                                                    $fdisplay(FILE, "Pc bus |  program_bus");  
            #10 pc_bus =  9'd0;   #1 $fdisplay(FILE, "%b  |  %b",pc_bus,program_bus);   
            #10 pc_bus =  9'd1;   #1 $fdisplay(FILE, "%b  |  %b",pc_bus,program_bus); 
            #10 pc_bus =  9'd2;   #1 $fdisplay(FILE, "%b  |  %b",pc_bus,program_bus);   
            #10 
  
       $fclose(FILE);
        $finish;
end 
endmodule