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
	
	// Assert reset from t=5 to t=10. The 'pc_bus' should 
	// output 9'b0 from the next positive edge of clk.
	initial 
	begin
		reset <= #5 1;
		reset <= #10 0;
	end	

	// Load a known value into the register at t=20.
	// The known value should be output on 'pc_bus'
	// at the next posedge(clk).
	// Increment the PC at t=30.
	initial 
	begin
		inc_pc <= #30 1;
		inc_pc <= #32 0;
	end	
		
endmodule

module test_pic10_ir;

	// These are the output signals from the Device Under Test:
	wire [11:0] ir_reg_bus;	// Output: Contains the instruction word in the Instruction Register.
	
	// These are the input signals to the Device Under Test:
	reg [11:0] program_mux_bus;	// Input: Carries the program word to load into the Instruction Register
							// (IR) when 'load_ir_reg' is asserted.					
	reg load_ir_reg;		// Input: Loads program_mux_bus into IR on the next posedge(clk).
	reg reset;				// Input: System reset.
	reg clk;				// Input: System clock.

	// This is the Device Under Test.
	pic10_ir ir(
		ir_reg_bus,			// Output: Contains the instruction word in the Instruction Register.
		program_mux_bus,	// Input: Carries the program word to load into the Instruction Register
							// (IR) when 'load_ir_reg' is asserted.					
		load_ir_reg,		// Input: Loads program_mux_bus into IR on the next posedge(clk).
		reset,				// Input: System reset.
		clk);				// Input: System clock.

	// Generate the clock signal.
	initial clk = 0;
	always #1 clk = ~clk;
	
	// Assert reset from t=5 to t=10. The 'ir_reg_bus' should 
	// output 000h from the next positive edge of clk.
	initial 
	begin
		reset <= #5 1;
		reset <= #10 0;
	end	

	// Load a known value into the register at t=20.
	// The known value should be output on 'ir_reg_bus'
	// at the next posedge(clk).
	initial 
	begin
		program_mux_bus <= #20 12'hABC;
		load_ir_reg <= #20 1;
		load_ir_reg <= #22 0;
	end	
	
endmodule

module test_pic10_w_reg;

	// These are the output signals from the Device Under Test:
	wire [7:0] w_reg_bus;	// Output: The output from the W register. Used as 1st ALU operand.

	// These are the input signals to the Device Under Test:
	reg [7:0] alu_bus;		// Input: The output from the ALU. This can either be
							// an unmodified, passed-through operand (W or register),
							// a literal (constant) from the instruction word or
							// the result from an arithmetic or logical operation
							// or some combination of the W reg, registers and a 
							// literal.
	reg load_w_reg;			// Input: Loads the data on the alu_bus into the W register.
	reg reset;				// Input: System reset.
	reg clk;				// Input: System clock.

	// This is the Device Under Test.
	pic10_w_reg m1(
		w_reg_bus,			// Output: The output from the W register. Used as 1st ALU operand.
		alu_bus,			// Input: The output from the ALU. This can either be
							// an unmodified, passed-through operand (W or register),
							// a literal (constant) from the instruction word or
							// the result from an arithmetic or logical operation
							// or some combination of the W reg, registers and a 
							// literal.
		load_w_reg,			// Input: Loads the data on the alu_bus into the W register.
		reset,				// Input: System reset.
		clk);				// Input: System clock.

	// Generate the clock signal.
	initial clk = 0;
	always #1 clk = ~clk;
	
	// Assert reset from t=5 to t=10. After reset the register
	// should be cleared and the w_reg_bus should read 00h.
	initial 
	begin
		reset <= #5 1;
		reset <= #15 0;
	end

	// Load 55h into the register at t=20;
	initial 
	begin
		alu_bus <= #20 8'h55;
		load_w_reg <= #20 1;
		load_w_reg <= #25 0;
	end
	
	// Load AAh into the register at t=30;
	initial 
	begin
		alu_bus <= #30 8'hAA;
		load_w_reg <= #30 1;
		load_w_reg <= #35 0;
	end

endmodule

module test_pic10_ram_registers;

	// These are the output signals from the Device Under Test:
	wire [7:0] ram_data_bus;// Output: Always outputs the data in the addressed register.

	// These are the input signals to the Device Under Test:
	reg [7:0] alu_bus=0;		// Input: The output from the ALU. Loaded into the register when the
							// load_ram_reg signal is asserted. 
	reg load_ram_reg=0;		// Input: Loads alu_bus into a General-purpose RAM register with the address 
							// driven on reg_addr_bus. The data is clocked in on the next 
							// posedge(clk). 
	reg [4:0] reg_addr_bus=0;	// Input: This is the currently selected register address (either
							// a direct address	or an indirect address selected by the Register
							// Address Mux). Note: The first RAM register is at address 8 because
							// the Special Function Registers have addresses 0..7.
	reg reset=0;				// Input: System reset.
	reg clk=0;					// Input: System clock.

	// This is the Device Under Test.
	pic10_ram_registers m1(
		ram_data_bus,		// Output: Always outputs the data in the addressed register.
		alu_bus,			// Input: The output from the ALU. Loaded into the register when the
							// load_ram_reg signal is asserted. 
		load_ram_reg,		// Input: Loads alu_bus into a General-purpose RAM register with the address 
							// driven on reg_addr_bus. The data is clocked in on the next 
							// posedge(clk). 
		reg_addr_bus,		// Input: This is the currently selected register address (either
							// a direct address	or an indirect address selected by the Register
							// Address Mux). Note: The first RAM register is at address 8 because
							// the Special Function Registers have addresses 0..7.
		reset,				// Input: System reset.
		clk);	
		
	// Generate the clock signal.
	always #1 clk = ~clk;
	
	// Assert reset from t=5 to t=8. After reset the registers
	// should be cleared and the ram_data_bus should read 00h
	// for all addresses (8..31).
	initial 
	begin
		reset <= #5 1;
		reset <= #8 0;
	end

	// Generate known data that we'll load into the RAM registers.
	always #1 alu_bus = alu_bus + 1;

	initial 
	begin
		// Start loading the RAM registers at t=12.
		load_ram_reg <= #12 1;	
	
		// Stop loading the RAM registers at t=64.
		load_ram_reg <= #64 0;	
	end

	// Increment the address every clock cycle so we 
	// clock in unique data in each register RAM location.
	always
	begin:load_block
		#2
		reg_addr_bus <= reg_addr_bus + 1;
		if(reg_addr_bus == 5'd31)
			disable load_block;
	end
	

endmodule

module test_pic10_alu;

	// These are the output signals from the Device Under Test:
	wire [7:0] alu_bus;			// Output: The output from the ALU. This can either be
								// an unmodified, passed-through operand (W or register),
								// a literal (constant) from the instruction word or
								// the result from an arithmetic or logical operation
								// or some combination of the W reg, registers and a 
								// literal.
	wire load_z;				// Output: The ALU will set this signal when the Z bit is affected 
								// by an ALU operation. The Z bit itself is part of the alu_status_bus.
	wire load_c;				// Output: The ALU will set this signal when the C bit is affected 
								// by an ALU operation. The C bit itself is part of the alu_status_bus.
	wire load_dc;				// Output: The ALU will set this signal when the DC bit is affected 
								// by an ALU operation. The DC bit itself is part of the alu_status_bus.
	wire [2:0] alu_status_bus;	// Output: The ALU drives the Z, C and/or DC status bits if affected
								// by the ALU operation input on the ir_reg_bus input.

	// These are the input signals to the Device Under Test:
	reg [7:0] w_reg_bus;		// Input: The output from the W register. Used as 1st ALU operand.
	reg [7:0] alu_mux_bus;		// Input: This is the bus that drives the ALUs 2nd operand.
	reg [11:0] ir_reg_bus;		// Input: The ALU retrieves the opcode and literal operands from this bus.
	reg carry_bit=0;				// Input: The carry bit from the STATUS register.

	// This is the Device Under Test.
	pic10_alu m1(
		alu_bus,				// Output: The output from the ALU. This can either be
								// an unmodified, passed-through operand (W or register),
								// a literal (constant) from the instruction word or
								// the result from an arithmetic or logical operation
								// or some combination of the W reg, registers and a 
								// literal.
		load_z,					// Output: The ALU will set this signal when the Z bit is affected 
								// by an ALU operation. The Z bit itself is part of the alu_status_bus.
		load_c,					// Output: The ALU will set this signal when the C bit is affected 
								// by an ALU operation. The C bit itself is part of the alu_status_bus.
		load_dc,				// Output: The ALU will set this signal when the DC bit is affected 
								// by an ALU operation. The DC bit itself is part of the alu_status_bus.
		alu_status_bus,			// Output: The ALU drives the Z, C and/or DC status bits if affected
								// by the ALU operation input on the ir_reg_bus input.
		w_reg_bus,				// Input: The output from the W register. Used as 1st ALU operand.
		alu_mux_bus,			// Input: This is the bus that drives the ALUs 2nd operand.
		ir_reg_bus,				// Input: The ALU retrieves the opcode and literal operands from this bus.
		carry_bit);				// Input: The carry bit from the STATUS register.

	// Test the instructions.
	initial begin	
		TestAddwf();
		
	end	
	
	task TestAddwf(); // Tested OK 1/22/07.
	begin
		
		$display("TestAddwf");
		
		// Set up the instruction word. Note that we clear out the source and destination 
		// register fields in the instruction word since that information is used by the 
		// controller to set up the datapath. The ALU doesn't care where the data is 
		// coming from or where it is going.
		ir_reg_bus = 12'b0001_1100_0000;
	
		// Let's add F0h and 16h. This should result in the result 06h with a 1 in the carry.
		w_reg_bus = 8'hF0;
		alu_mux_bus = 8'h16;
		
		#5;
		
		// Then let's add 0Fh and 01h. This should result in the DC flag being set.
		w_reg_bus = 8'h0F;
		alu_mux_bus = 8'h01;
	
	 	#5;
		
		// Then let's add FFh and 01h. This should result in the C, DC and Z flags being set.
		w_reg_bus = 8'hFF;
		alu_mux_bus = 8'h01;

		#5;
	  
	end
	endtask	
endmodule