module test_pic10_alu;

	wire [7:0] alu_bus;			
								
	reg [7:0] w_reg_bus;		// primer operando de la ALU
	reg [7:0] alu_mux_bus;		// segundo operando de la lu
	reg [11:0] ir_reg_bus;		// 

	pic10_alu m1(
		alu_bus,			.
		w_reg_bus,				
		alu_mux_bus,			
		ir_reg_bus);			// opcode

	// Instrucciones.
	initial begin	
		TestAddwf();
	end	
	
	task TestAddwf(); 
	begin
		
		$display("TestAddwf");
			
		// Configura la palabra de instrucción. Tenga en cuenta que borramos el origen y el destino
		// A la ALU no le importa dónde están los datos
		// procedente o adonde va.
		ir_reg_bus = 12'b0001_1100_0000;
	

// Agreguemos F0h y 16h. Esto debería resultar en el resultado 06h con un 1 en el acarreo.
		w_reg_bus = 8'hF0;
		alu_mux_bus = 8'h16;
		
		#5;
	  
	end
	endtask	
endmodule