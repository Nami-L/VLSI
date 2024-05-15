module test_pic10_w_reg;

	// These are the output signals from the Device Under Test:
	wire [7:0] w_reg_bus;	// Primer operando de la ALU

	reg [7:0] alu_bus;		
	reg load_w_reg;			// Carga el valor de alu_bus en el registro W.
	reg reset;				
	reg clk;				

	pic10_w_reg m1(
		w_reg_bus,			
		alu_bus,			
		load_w_reg,			
		reset,				
		clk);				

	initial clk = 0;
	always #1 clk = ~clk;
	
	
// Confirmar reinicio de t = 5 a t = 10. Después de restablecer el registro
// debe borrarse y w_reg_bus debe leer 00h.
	initial 
	begin
		reset <= #5 1;
		reset <= #15 0;
	end

// Carga 55h en el registro en t = 20;
	initial 
	begin
		alu_bus <= #20 8'h55;
		load_w_reg <= #20 1;
		load_w_reg <= #25 0;
	end
	
	// carga AAh en el registro en t=30;
	initial 
	begin
		alu_bus <= #30 8'hAA;
		load_w_reg <= #30 1;
		load_w_reg <= #35 0;
	end

endmodule