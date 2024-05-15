`timescale 1ns/1ps
module opcode10F200_TB ();
    reg [7:0]f,w;
    reg [11:0] opcode;
    wire [7:0] R;
    integer FILE;
opcode10F200 DUT (f,w,opcode,R);
initial
begin
      f = 8'b00000001;
      w = 8'b00000010;
      opcode = 12'b000000000000;
     FILE = $fopen("DataOut.txt");
                                        $fdisplay(FILE, "opcode  |  R");  
         opcode =  12'b000111111111;   #1 $fdisplay(FILE, "%b  |  %b",opcode,R);
         #10 opcode =  12'b000101111111; #1 $fdisplay(FILE, "%b  |  %b",opcode,R);
         #10 opcode =  12'b000001111111; #1 $fdisplay(FILE, "%b  |  %b",opcode,R);
         #10 opcode =  12'b000001000000; #1 $fdisplay(FILE, "%b  |  %b",opcode,R); 
         #10 opcode =  12'b001001111111; #1 $fdisplay(FILE, "%b  |  %b",opcode,R);
         #10 opcode =  12'b000011111111; #1 $fdisplay(FILE, "%b  |  %b",opcode,R);
         #10 opcode =  12'b001011111111; #1 $fdisplay(FILE, "%b  |  %b",opcode,R);    
         #10 opcode =  12'b001010111111; #1 $fdisplay(FILE, "%b  |  %b",opcode,R); 
         #10 opcode =  12'b001111111111; #1 $fdisplay(FILE, "%b  |  %b",opcode,R); 
         #10 opcode =  12'b000100111111; #1 $fdisplay(FILE, "%b  |  %b",opcode,R);
         #10 opcode =  12'b001000111111; #1 $fdisplay(FILE, "%b  |  %b",opcode,R);    
         #10 opcode =  12'b000000111111; #1 $fdisplay(FILE, "%b  |  %b",opcode,R); 
         #10 opcode =  12'b001101111111; #1 $fdisplay(FILE, "%b  |  %b",opcode,R); 
         #10 opcode =  12'b001100111111; #1 $fdisplay(FILE, "%b  |  %b",opcode,R);    
         #10 opcode =  12'b000010111111; #1 $fdisplay(FILE, "%b  |  %b",opcode,R); 
         #10 opcode =  12'b001110111111; #1 $fdisplay(FILE, "%b  |  %b",opcode,R); 
         #10 opcode =  12'b000110111111; #1 $fdisplay(FILE, "%b  |  %b",opcode,R);   
       
       $fclose(FILE);
end 
endmodule