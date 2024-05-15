module test_pic10_ram_registers;

	wire [7:0] ram_data_bus;// Siempre emite los datos en el registro direccionado.

	// These are the input signals to the Device Under Test:
	reg [7:0] alu_bus=0;	// La salida de la ALU cargado en el registro
							//cuando la señal load_ram_reg se activa
	reg load_ram_reg=0;		// carga alu_bus en el registro ram, a traves de reg_addr_bus
	reg [4:0] reg_addr_bus=0;	// esta el a direccion de registro actualmente seleccionada.
	reg reset=0;				// Input: System reset.
	reg clk=0;					// Input: System clock.

	// This is the Device Under Test.
	pic10_ram_registers m1(
		ram_data_bus,		
		load_ram_reg,		
		reg_addr_bus,		
		clk);	
		
	always #1 clk = ~clk;
	
	// conrifma el reinicio de t=5 a t=8. Y el ram_data_bus debe leer 00h, ya
	// que se reinicio
	initial 
	begin
		reset <= #5 1;
		reset <= #8 0;
	end

//genera datos conocidos que cargamos en la RAM
	always #1 alu_bus = alu_bus + 1; //always siempre se ejecutara durante la simulacion

	initial 
	begin
		// empieza cargando los registros RAM en t=12.
		load_ram_reg <= #12 1;	
	
		// Deja de cargar los regsitro de ram en t=64.
		load_ram_reg <= #64 0;	
	end

// Incrementar la dirección cada ciclo de reloj para que
// Registra datos únicos en cada ubicación de RAM de registro.
	always
	begin:load_block
		#2
		reg_addr_bus <= reg_addr_bus + 1;
		if(reg_addr_bus == 5'd31)
			disable load_block;
	end
	

endmodule