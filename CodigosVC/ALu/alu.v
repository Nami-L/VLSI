module ALU( //describir un componenete
    input  [7:0] A,B,
    input  [3:0] opcode, //señales faltan el m y c
    input  wire m,cn,l,h,
    output [7:0] R, //resultado
    output [3:0] Flags//Banderas
           ); //entradas tipo alambre      
        reg [7:0] outALU,mFlags;
        always @(*) //cuando varia cualquiera de las entradas se hara
                    // la operación
            begin
               if((m==1)&&(l==1))
            case (opcode)           
                4'b0000: outALU=~A;
                4'b0001: outALU=~(A&B);
                4'b0010: outALU=~A|B;
                4'b0011: outALU=1;
                4'b0100: outALU=~(A|B);
                4'b0101: outALU=~B;
                4'b0110: outALU=~(A^B);//^XOR
                4'b0111: outALU=A|(~B);
                4'b1000: outALU=~A&B;
                4'b1001: outALU=A^B;
                4'b1010: outALU=B;
                4'b1011: outALU=A|B;
                4'b1100: outALU=0;
                4'b1101: outALU=A&(~B);
                4'b1110: outALU=A&B;
                4'b1111: outALU=A;
                default: outALU=B;    
            endcase
                else if((m==0&&cn==0&&l==1))
                case (opcode)           
                4'b0000: outALU=A-4'b0001;
                4'b0001: outALU=(A&B)-4'b0001;
                4'b0010: outALU=A&(~B)-4'b0001;
                4'b0011: outALU=-4'b0001;
                4'b0100: outALU=A+(A|(~B));
                4'b0101: outALU=(A&B)+(A|(~B));
                4'b0110: outALU=A-B-4'b0001;
                4'b0111: outALU=A|(~B);
                4'b1000: outALU=A+(A|B);
                4'b1001: outALU=A+B;
                4'b1010: outALU=(A&(~B))&(A|B);
                4'b1011: outALU=A|B;
                4'b1100: outALU=A+(A<<<1);
                4'b1101: outALU=(A&B)+A;
                4'b1110: outALU=(A&(~B))+A;
                4'b1111: outALU=A;
                default: outALU=B;
            endcase
               else if((m==1)&&(h==1))
                case (opcode)           
                4'b0000: outALU=~A;
                4'b0001: outALU=~(A|B);
                4'b0010: outALU=(~A)&B;
                4'b0011: outALU=0;
                4'b0100: outALU=~(A&B); 
                4'b0101: outALU=~B;
                4'b0110: outALU=(A^B);//^XOR
                4'b0111: outALU=A&(~B);
                4'b1000: outALU=(~A)|B;
                4'b1001: outALU=~(A^B);
                4'b1010: outALU=B;
                4'b1011: outALU=A&B;
                4'b1100: outALU=1;
                4'b1101: outALU=A|(~B);
                4'b1110: outALU=A|B;
                4'b1111: outALU=A;
                default:
                outALU=B;
            endcase
                else if((m==0)&&(cn==1)&&(h==1))
                case (opcode)           
                4'b0000: outALU=A;
                4'b0001: outALU=(A|B);
                4'b0010: outALU=A|(~B);
                4'b0011: outALU=-1;
                4'b0100: outALU=A+(A&(~B));
                4'b0101: outALU=(A|B)+(A&(~B));
                4'b0110: outALU=A-B;//^XOR
                4'b0111: outALU=A&(~B)-1;
                4'b1000: outALU=A+(A&B);
                4'b1001: outALU=A+B;
                4'b1010: outALU=(A|(~B))+(A&B);
                4'b1011: outALU=(A&B)-1;
                4'b1100: outALU=A+A;
                4'b1101: outALU=(A|B)+A;
                4'b1110: outALU=(A|(~B))+A;
                4'b1111: outALU=A-1;
                default: outALU=B;
            endcase 
                
end
assign R=outALU;
//assign Flags={..};
endmodule