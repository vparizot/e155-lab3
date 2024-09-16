// Victoria Parizot
// vparizot@g.hmc.edu
// 9/5/2024

// calls internal high-speed oscillator and initializes a selector variable, 
// which fluctuates at a frequency determines by counter
module hsoscEnable(
	output logic selector, clk);

// variables
	logic pulse;
	logic int_osc;
	logic led_state = 0;
	logic [24:0] counter = 0;
	//logic selector = 0;

// Internal high-speed oscillator
	HSOSC hf_osc (.CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(int_osc));
	
// Simple clock divider
	always_ff @(posedge int_osc)
	begin
		counter <= counter + 1;
		// at hz
		if (counter == 10000)
		begin
			counter <= 0;
			if (selector == 0) selector <= 1 ; // turn on LED if off
			else selector <= 0; //turn OFF led
		end
	end

assign clk = counter[4];
endmodule