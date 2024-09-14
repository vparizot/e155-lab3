
module keyBounce(
	input logic clk, reset,
	input logic [3:0] keyDecoded,
	input logic keyPressed,
	output logic [3:0] keyDebounced
);


//define counter variable
logic [10:0] counter = 0;

always_ff @(posedge clk, posedge reset)
	begin
		if (counter > 11'b11111111110) counter <= 6; // reset counter incase long button press
		else if (counter > 5) keyDebounced = keyDecoded; // if threshold is met, output KeyDecoded
	
		if (keyPressed) counter <= counter + 1; // if key is pressed, add to counter
			
		else counter <= 0; // reset counter if key is not pressed
			


	end




endmodule
