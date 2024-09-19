// Victoria Parizot
// vparizot@g.hmc.edu
// 09/19/2024

// descr: top module for lab 3, calls sub modules for scanning kepypad for multiplexed seven seg display

module top(
	input logic c0in, c1in, c2in, c3in, reset,
	output logic [3:0] r,
	output logic [6:0] segOut,
	output logic selector, selector2
);
// internal variables 
logic [3:0] keyDecoded, keyDebounced, s1, s2, sy;
logic enabled, keypressed;
logic c0, c1, c2, c3, c0temp1, c1temp1, c2temp1, c3temp1;

// creat clock signal
hsoscEnable m1(selector, clk); 

//synchronizers for async button press input
always @(posedge clk) begin
		c0temp1 <= c0in;
		c1temp1 <= c1in;
		c2temp1 <= c2in;
		c3temp1 <= c3in;
		c0 <= c0temp1;
		c1 <= c1temp1;
		c2 <= c2temp1;
		c3 <= c3temp1;
end

// call scanfsm to recieve decoded key from keypad
scanfsm m2(clk, reset, c0in, c1in, c2in, c3in, keyDecoded, r, keyPressed);

// check decodedKey for switch bouncing
keyBounce m3(clk, reset, keyDecoded, keyPressed, s1, s2);

// shift digit displayed
//shifter m4(clk, reset, enabled, keyDebounced, s1, s2);
 
// deliver sy
mux m5(s1, s2, selector, sy);

// pass sy to read into hex output
sevensegments m6(sy, segOut);

assign selector2 = ~selector; 

endmodule