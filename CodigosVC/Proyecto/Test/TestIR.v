`timesca`timescale 1ns/100ps

module test_pic10_ir;
	reg clk;
    reg reset;		
    reg load_ir_reg;		// Carga program_mux_bus en IR en el siguiente posedge (clk).		
	reg [11:0] program_bus;	// Input: lleve la palabra para cargarla en IR				
	wire [11:0] ir_reg_bus;	//contiene la palabra de instrucción en el registro de instrucción.
	
	pic10_ir ir(.clk(clk),.reset(reset),.load_ir_reg(load_ir_reg),
				.program_bus(program_bus),.ir_reg_bus(ir_reg_bus));
	  			
//generar señal de control
	initial 
	begin 
	clk = 0;
	reset=0;
	load_ir_reg=0;
	program_bus=0;
	end
	always #1 clk = ~clk; //pagina 290 VERILOG
// Confirmar reinicio de t = 5 a t = 10. El 'ir_reg_bus' debería
// Salida 000h desde el siguiente flanco positivo de clk.
	initial 
	begin
		reset = 1;
		reset <= #10 0;
	end	
	//= Asignacion se realizan las operaciones en paralelo Pagina 292
	// <= Esto permite que las asignaciones se ejecuten en el orden en el que se enumeran en el bloque 
	//sin asignar asignaciones provisionales en cascada a través de la lista. PAGINA 292 VERILOG
	
// Cargue un valor conocido en el registro en t = 20.
// El valor conocido debe aparecer en 'ir_reg_bus'
// en el siguiente posedge (clk).
	initial 
	begin
		program_bus <= #20 12'hABC;
		load_ir_reg <= #20 1;
		load_ir_reg <= #22 0;
	end	
endmodule