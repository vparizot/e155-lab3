// Victoria Parizot
// vparizot@g.hmc.edu
// 09/19/2024

// descr: FSM to deal with key bouncing, calls sub module shifter to shift discplay

module keyBounce(
	input logic clk, reset,
	input logic [3:0] keyDecoded,
	input logic keyPressed, 
	output logic [3:0] s1, s2
	//output logic [3:0] keyDebounced
);

	typedef enum logic [1:0] {St0 = 0, St1 = 1, St2 = 2, St3 = 3} statetype;
	statetype state, nextstate;
	
	logic [11:0] counter;
	logic enabled;
	
	always_ff @(posedge clk) begin
		if (reset == 0) begin
				state <= St0;
				counter <=0;
		end
		else if (state == St1) begin
			if (counter > 50) begin
				state <= St2;
				counter <= 0;
			end
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
			St0: if (keyPressed) nextstate = St1;
			    else nextstate = St0;
					
			//Counting state -- ADD LOGIC
			St1: if (keyPressed == 0) nextstate = St0; // if button pressed, think longer
			    else nextstate = St1; // if button unpressed, go to waiting state
					
			//Print
			St2: if (keyPressed) nextstate = St3;
				else nextstate = St3;
					
			//holding state
			St3: if (keyPressed) nextstate = St3;
				else nextstate = St0;
					
			default: nextstate = St0;
		endcase
		
		assign enabled = (state == St2);
		
		logic [3:0] s1, s2;
		shifter mod1(clk, reset, enabled,keyDecoded, s1, s2);

endmodule