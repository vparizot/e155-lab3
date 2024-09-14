// Victoria Parizot
// vparizot@g.hmc.edu
// 09/06/2024

// descr: top module for lab 3, calls sub modules for multiplexed display

module top(
	input logic [3:0] s1, s2,
	input logic clk, reset,
	output logic [6:0] segOut,
	output logic selector, selector2
);

// flipflops for inputs

// call scanfsm to recieve decoded key from keypad
scanfsm m1(clk, reset, c0, c1, c2, c3, decodedKey);

// check decodedKey for switch bouncing
keyBounce m2(clk, reset, keyDecoded, keyPressed, keyDebounced);


// shift digit displayed
shifter m3(keyDebounced, s1, s2);


//oscilate selector variable
hsoscEnable m4(selector); // create selector signal
 
// deliver sy
mux2 m5(s1, s2, selector, sy);

// pass sy to read into hex output
sevensegments m6(sy, segOut);

// call led sum
sum2 m7(s1, s2, led);

assign selector2 = ~selector; 

endmodule