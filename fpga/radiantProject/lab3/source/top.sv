// Victoria Parizot
// vparizot@g.hmc.edu
// 09/06/2024

// descr: top module for lab 3, calls sub modules for multiplexed display

module top(
	input logic c0in, c1in, c2in, c3in, reset,
	output logic [6:0] segOut,
	output logic selector, selector2
);

logic c0, c1, c2, c3, c0temp1,c1temp1,c2temp1,c3temp1, c0temp2, c1temp2, c2temp2, c3temp2;

hsoscEnable m1(selector, clk); // create clock signal

// flipflops for inputs
always_ff @(posedge clk) begin
		c0temp1 <= c0in;
		c1temp1 <= c1in;
		c2temp1 <= c2in;
		c3temp1 <= c3in;
end

always_ff @(posedge clk) begin
		c0temp2 <= c0temp1;
		c1temp2 <= c1temp1;
		c2temp2 <= c2temp1;
		c3temp2 <= c3temp1;
end

always_ff @(posedge clk) begin
		c0 <=  c0temp2;
		c1 <=  c1temp2;
		c2 <=  c2temp2;
		c3 <=  c3temp2;
end

// call scanfsm to recieve decoded key from keypad
scanfsm m2(clk, reset, c0in, c1, c2, c3, keyDecoded,keyPressed);

// check decodedKey for switch bouncing
keyBounce m3(clk, reset, keyDecoded, keyPressed, keyDebounced);


// shift digit displayed
shifter m4(keyDebounced, s1, s2);

//oscilate selector variable
 
// deliver sy
mux m5(s1, s2, selector, sy);

// pass sy to read into hex output
sevensegments m6(sy, segOut);

assign selector2 = ~selector; 

endmodule