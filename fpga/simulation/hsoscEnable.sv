
// Victoria Parizot
// vparizot@g.hmc.edu
// 09/09/2024

// descr: slows clock & stores in selector value

module hsoscEnable(
	input logic clk,
	output logic selector);

// variables
	//logic int_osc;

	logic pulse;
	logic led_state = 0;
	logic [24:0] counter = 0;
	
// Internal high-speed oscillator
	//HSOSC hf_osc (.CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(int_osc));
	
// Simple clock divider
	always_ff @(posedge clk)
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


endmodule