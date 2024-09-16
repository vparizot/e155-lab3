
module scanfsm(
	input logic clk, reset,
	input logic c0, c1, c2, c3,
	output logic [3:0] keyDecoded, r,
	output logic keyPressed, enable
);

	//logic [3:0] r; 

	// define the states
	typedef enum logic [3:0] {S0 = 0, S1 = 1, S2 = 2, S3 = 3, S4 = 4, S5 = 5, S6 = 6, S7 = 7, S8 = 8, S9 = 9, S10 = 10, S11 = 11} statetype;
	statetype state, nextstate;

	// state register
	always_ff @(posedge clk) begin
		if (reset == 0) state <= S0;
		else state <= nextstate;
	end
	
	assign r[0] = (state == S0) | (state == S1) | (state == S2);
	assign r[1] = (state == S3) | (state == S4) | (state == S5);
	assign r[2] = (state == S6) | (state == S7) | (state == S8);
	assign r[3] = (state == S9) | (state == S10) | (state == S11);
	assign keyPressed = (c0|c1|c2|c3);
	assign enable = (state == S1) | (state == S4) | (state == S7) | (state == S10);
	
	// Next state logic
	always_comb begin
		case (state)
			S0: if (keyPressed) nextstate = S1;
			    else nextstate = S3;
			S1: if (keyPressed) nextstate = S2;
			    else nextstate = S0;
			S2: if (keyPressed) nextstate = S2;	// Next state logic
			    else nextstate = S0;
			S3: if (keyPressed) nextstate = S4;
			    else nextstate = S6;
			S4: if (keyPressed) nextstate = S5;
			    else nextstate = S3;
			S5: if (keyPressed) nextstate = S5;
			    else nextstate = S0;
			S6: if (keyPressed) nextstate = S7;
			    else nextstate = S9;
			S7: if (keyPressed) nextstate = S8;
			    else nextstate = S6;
			S8: if (keyPressed) nextstate = S8;
			    else nextstate = S6;
			S9: if (keyPressed) nextstate = S10;
			    else nextstate = S0;
			S10: if (keyPressed) nextstate = S11;
			    else nextstate = S9;
			S11: if (keyPressed) nextstate = S11;
			    else nextstate = S9;
			default: nextstate = S0;
		endcase
	end
	// output logic
	scanDecoder mod1({r,c0,c1,c2,c3}, keyDecoded);
	

	//assign key =  {r0,r1,r2,r3,c0,c1,c2,c3}; //(state == S1) |(state == S4)|(state == S7)|(state == S10 )&&


endmodule  