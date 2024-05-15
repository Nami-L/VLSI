  module opcode10F200( //describir un componenete
   input  [7:0] f,w,
    input  [11:0] opcode, //se�ales binario 12-bits
    output [7:0] R //resultado
           ); //entradas tipo alambre      
        reg [7:0] outALU;
        always @(*) //cuando varia cualquiera de las entradas se hara
                    // la operaci�n
            begin
            case (opcode)          
                12'b0001_11xx_xxxx: addwf();   //    12'b000111111111: outALU=w+f;
                12'b0001_0111_1111: outALU=(w&f);   
                12'b000001111111: outALU=(4'b0000)&(f);
                12'b000001000000: outALU=(4'b0000)&(w);//clear
                12'b001001111111: outALU=f -(4'b0001); 
                12'b000011111111: outALU=f -(4'b0001);//salto
                12'b001011111111: outALU=f+(4'b0001); 
                12'b001010111111: outALU=f+(4'b0001);   //salto 
                12'b001111111111: outALU=(w||f);//or 
                12'b000100111111: outALU=(f<<1);  
                12'b001000111111: outALU=f-(4'b0001);
                12'b000000111111: outALU=f-(4'b0001);
               // 12'b000000000000: outALU=8f-12'b000000000001; //no operation
                12'b001101111111: outALU=f-(4'b0001); 
                12'b001100111111: outALU=f-(4'b0001);     
                12'b000010111111: outALU=(w-f); 
                12'b001110111111: outALU=f-(4'b0001);//swap intercambia niveles altos y bajos
                12'b000110111111: outALU=(w^f);   //xor
                                            //TT- F;TF -T; FT -T; FF -F;           
                default: outALU=f;    
            endcase           
end
assign R=outALU;
endmodule