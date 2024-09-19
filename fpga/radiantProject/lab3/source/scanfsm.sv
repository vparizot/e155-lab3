// Victoria Parizot
// vparizot@g.hmc.edu
// 09/19/2024

// descr: scans for key presses on keypad with an FSM. calls submodule scan decoder to get key value

module scanfsm(
	input logic clk, reset,
	input logic c0, c1, c2, c3,
	output logic [3:0] keyDecoded, r,
	output logic keyPressed
);

	//logic [3:0] keyDecoded; 

	// define the states
	typedef enum logic [3:0] {S0 = 0, S1 = 1, S2 = 2, S3 = 3, S4 = 4, S5 = 5, S6 = 6, S7 = 7, S8 = 8, S9 = 9, S10 = 10, S11 = 11} statetype;
	//typedef enum logic [5:0] {S0 = 0, S1 = 1, S2 = 2, S3 = 3, S4 = 4, S5 = 5, S6 = 6, S7 = 7, S8 = 8, S9 = 9, S10 = 10, S11 = 11, S12 = 12, S13 = 13, S14 = 14, S15 = 15, S16 = 16, S17 = 17, S18 = 18, S19 = 19, S20 = 20, S21 = 21, S22 = 22, S23 = 23} statetype;


	statetype state, nextstate;
	
	// state register
	always_ff @(posedge clk) begin
		if (reset == 0) state <= S0;
		state <= nextstate;
	end
	
	
	assign r[0] = (state == S0) || (state == S1) || (state == S2);
	assign r[1] = (state == S3) || (state == S4) || (state == S5);
	assign r[2] = (state == S6) || (state == S7) || (state == S8);
	assign r[3] = (state == S9) || (state == S10) || (state == S11);
	assign keyPressed = (c0|c1|c2|c3);
	
// Next state logic
	always_comb 
		case (state)
			S0: if (keyPressed) nextstate = S1;
			    else nextstate = S3;
					
			//S0: if (keyPressed) nextstate = S1;
			    //else nextstate = S12;
			//S12: nextstate = S13;
			//S13: nextstate = S14;
			//S14: nextstate = S3;
					
					
			S1: if (keyPressed) nextstate = S2;
			    else nextstate = S0;
			S2: if (keyPressed) nextstate = S2;	// Next state logic
			    else nextstate = S0;
			S3: if (keyPressed) nextstate = S4;
			    else nextstate = S6;
					
			//S3: if (keyPressed) nextstate = S4;
				//else nextstate = S15;
			//S15: nextstate = S16;
			//S16: nextstate = S17;
			//S17: nextstate = S6;
					
					
					
			S4: if (keyPressed) nextstate = S5;
			    else nextstate = S3;
			S5: if (keyPressed) nextstate = S5;
			    else nextstate = S0;
			S6: if (keyPressed) nextstate = S7;
			    else nextstate = S9;
					
			//S6: if (keyPressed) nextstate = S7;
				//else nextstate = S18;
			//S18: nextstate = S19;
			//S19: nextstate = S20;
			//S20: nextstate = S9;
			
			S7: if (keyPressed) nextstate = S8;
			    else nextstate = S6;
			S8: if (keyPressed) nextstate = S8;
			    else nextstate = S6;
			
			S9: if (keyPressed) nextstate = S10;
			    else nextstate = S0;
					
			//S9: if (keyPressed) nextstate = S10;
				//else nextstate = S21;
			//S21: nextstate = S21;
			//S22: nextstate = S22;
			//S23: nextstate = S0;
			
			
			S10: if (keyPressed) nextstate = S11;
			    else nextstate = S9;
			S11: if (keyPressed) nextstate = S11;
			    else nextstate = S9;
			default: nextstate = S0;
		endcase
	
	
	

	scanDecoder mod1(r, c0, c1, c2, c3, keyDecoded);




endmodule  