
module keyBounce(
	input logic clk, reset,
	input logic [3:0] keyDecoded,
	input logic keyPressed, 
	output logic [3:0] s1, s2
	//output logic [3:0] keyDebounced
);

	typedef enum logic [1:0] {S0 = 0, S1 = 1, S2 = 2, S3 = 3} statetype;
	statetype state, nextstate;
	
	logic [11:0] counter;
	logic enabled;
	
	always_ff @(posedge clk) begin
		if (reset == 0) state <= S0;
		else if (state == S1) begin
			if (counter > 100) state <= S2;
			else begin 
				counter <= counter + 1;
				state <= nextstate;
			end
		end
		else state <= nextstate;
	end
	
	
	always_comb 
		case (state)
			// Waiting state
			S0: if (keyPressed) nextstate = S1;
			    else nextstate = S0;
					
			//Counting state -- ADD LOGIC
			S1: if (keyPressed == 0) nextstate = S0; // if button pressed, think longer
			    else nextstate = S0; // if button unpressed, go to waiting state
					
			//Print
			S2: if (keyPressed) nextstate = S3;
				else nextstate = S3;
					
			//holding state
			S3: if (keyPressed) nextstate = S3;
				else nextstate = S0;
					
			default: nextstate = S0;
		endcase
		
		assign enabled = (state == S2);
		
		logic [3:0] s1, s2;
		shifter mod1(clk, reset, enabled,keyDecoded, s1, s2);

	
	
				



//define counter variable
/*logic [12:0] counter = 0;
always_ff @(posedge clk) 
	begin
		//if (keyPressed) keyDebounced <= keyDecoded;		
			
		counter <= counter +1;
		enabled <= 0;		
		if ((reset == 0) || (~keyPressed)) begin
			counter <= 0;
		end
		else if (counter == 50) begin
			
			enabled <= 1;
		end
		if (enabled) keyDebounced <= keyDecoded;
		//else if (counter > 100) counter <= 51;		
			
	end*/
endmodule