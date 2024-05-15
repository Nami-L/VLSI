  module opcode10F200( //describir un componenete
   input  [7:0] f,w,
    input  [11:0] opcode, //señales binario 12-bits
    output [7:0] R //resultado
           ); //entradas tipo alambre      
        reg [7:0] outALU;
        always @(*) //cuando varia cualquiera de las entradas se hara
                    // la operación
            begin
            case (opcode)          
                12'b0001_11xx_xxxx: addwf();   //    12'b000111111111: outALU=w+f;
         
                default: outALU=f;    
            endcase           
end
assign R=outALU;
endmodule