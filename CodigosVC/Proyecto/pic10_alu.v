`timescale 1ns / 100ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Ciro Fabian Bermudez Marquez y Luis Enrique Namigtle Jimenez
// Engineer: 
// 
// Create Date:    07:47:12 11/15/2020 
// Design Name: 
// Module Name:    pic10_alu 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module pic10_alu(
	input [7:0] w_reg_bus,
	input	[7:0] ram_data_bus,				// input [7:0] alu_mux_bus,
	input [11:0] ir_reg_bus,
	//input carry_bit;
	//output reg [2:0] alu_status_bus
	output reg [7:0] alu_bus
    );
	/*----------------------------*/
	/*------ Implementaci?n ------*/
	/*----------------------------*/
	
	always @(w_reg_bus, ram_data_bus, ir_reg_bus)			// w_reg_bus, alu_mux_bus, ir_reg_bus, carry_bit
	begin
	
		casex(ir_reg_bus)// pagina 301 Verilog
		// Mnemoric 			Description				Cycles			12-Bit Opcode		Status Affected	
		
		// ADDWF	f, d			Add W and f				1					0001 11df ffff		C, DC, Z		
			12'b0001_11xx_xxxx: addwf();
			
		// BCF		f, b		Bit Clear f				1					0100 bbbf ffff		None			
			12'b0100_xxxx_xxxx: bcf();
			
		// MOVLW	k			Move literal to W			1					1100 kkkk kkkk		None
			12'b1100_xxxx_xxxx: movlw();
		endcase
	end
	
	task addwf(); // 0001 11df ffff
		begin 
			alu_bus = w_reg_bus + ram_data_bus;			// alu_bus = w_reg_bus + alu_mux_bus
		end
	endtask
	
	task bcf(); // 0100 bbbf ffff
		reg [2:0] b;//b=[111]
		reg [7:0] mascara; 
			begin 
				b = ir_reg_bus[7:5];   // Borra el bit 'b' del registro 'f
				mascara = ~(1<<b);
				alu_bus = ram_data_bus & mascara;			// alu_bus = alu_mux_bus & mask;	
			end
	endtask
	
	task movlw();
		begin 
			alu_bus = ir_reg_bus[7:0];//[11111111]
		end
	endtask
	
endmodule
