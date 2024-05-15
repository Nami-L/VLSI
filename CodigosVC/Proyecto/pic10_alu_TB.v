`timescale 1ns/100ps
module pic10_alu_TB ();
    reg [7:0] w_reg_bus,ram_data_bus;
    reg [11:0] ir_reg_bus;
    wire [7:0] alu_bus;
    integer FILE;
pic10_alu DUT (.w_reg_bus(w_reg_bus),
              .ram_data_bus(ram_data_bus),
              .ir_reg_bus(ir_reg_bus),
              .alu_bus(alu_bus));
initial
begin
      w_reg_bus = 8'b00000001; //valores arbitrarios
      ram_data_bus = 8'b00000011;

      FILE = $fopen("DataOut.txt");
                                         $fdisplay(FILE, "IR  |  alu_bus");  
             ir_reg_bus =  12'b0001_1100_0000;   #1 $fdisplay(FILE, "%b  |  %b",ir_reg_bus,alu_bus);//suma
         #10 ir_reg_bus =  12'b0100_0010_0001; #1 $fdisplay(FILE, "%b  |  %b",ir_reg_bus,alu_bus);//  // Borra el bit 'b' del registro 'f
         #10 ir_reg_bus =  12'b1100_1111_0010; #1 $fdisplay(FILE, "%b  |  %b",ir_reg_bus,alu_bus);//move
         #10
        
       $fclose(FILE);
       $finish;
       
end 
//$finish
endmodule