`timescale 1ns/100ps

module pic10_datapath(
	inout [7:0] gpio5_pin_bus,	
	inout [7:0] gpio6_pin_bus,	
	inout [7:0] gpio7_pin_bus,	
	input reset, 				//reset
	input clk,					//reloj
	////////////////////salidas	////////////////							
	output [11:0] ir_reg_bus,	//transifere el codigo de la intruccion actual al
								//controlador y este  defina la ruta de 
								//datos  para ejecutar la instruccion

	output [8:0] pc_bus,		//La direccion de memoria dara como resultado
								//que las intruciones del programa se reciban en el
								//program_bus 

	///////////////////entradas/////////////////////////
								
	input load_w_reg,			// carga el valor de alu_bus en el registro W
								//en el siguiente flanco positivo de reloj.  

	input inc_pc,				//incrementa el contador de programa.
								
	input load_ir_reg,			// Carga IR con el contenido de la palabra de memoria
								// del programa que la PC esta direccionando actualmente
								
	input [11:0] program_bus,	//intruccion actual de la memoria 
								// en la direccion de salida pc_bus.

	input reset,				// System reset.
	input clk					// System clock.
								
	);


	);

endmodule
