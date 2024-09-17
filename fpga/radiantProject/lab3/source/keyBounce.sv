
module keyBounce(
	input logic clk, reset,
	input logic [3:0] keyDecoded,
	input logic keyPressed,
	output logic [3:0] keyDebounced
);


//define counter variable
logic [12:0] counter = 0;
always_ff @(posedge clk) 
	begin
		if (keyPressed) keyDebounced <= keyDecoded;		
			

		//counter <= counter +1;		
		//if ((reset == 0) || (~keyPressed)) counter <= 0;
		//else if (counter == 5) begin
		//	keyDebounced <= keyDecoded;
		//end
		//else if (counter > 100) counter <= 6;		
			
	end
endmodule