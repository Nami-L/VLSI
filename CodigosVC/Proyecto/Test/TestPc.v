module test_pic10_pc;

	wire [8:0] pc_bus;		// Relaciona el program memory.
	reg inc_pc = 0;			// Incremente el contador de programa
	reg reset = 0;			// Reset
	reg clk = 0;			// Reloj
	
	pic10_pc pc(
		pc_bus,				
		inc_pc,				
		reset,				
		clk);				

	// Generamos la señal de control.
	always #1 clk = ~clk;
	
	
// Confirmar reinicio de t = 5 a t = 10. El 'pc_bus' debería
// salida 9'b0 desde el siguiente borde positivo de clk.
	initial 
	begin
		reset <= #5 1;
		reset <= #10 0;
	end	

	// Cargue un valor conocido en el registro en t = 20.
// El valor conocido debe aparecer en 'pc_bus'
// en el siguiente posedge (clk).
// Incrementa el PC en t = 30.
	initial 
	begin
		inc_pc <= #30 1;
		inc_pc <= #32 0;
	end	
		
endmodule