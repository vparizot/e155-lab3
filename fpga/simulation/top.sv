// Victoria Parizot
// vparizot@g.hmc.edu
// 09/06/2024

// descr: top module for lab 3, calls sub modules for multiplexed display

module top(
	input logic [3:0] s1, s2,
	input logic clk,
	output logic [6:0] segOut,
	output logic [4:0] led,
	output logic selector, selector2
);

// define middle variables
logic [3:0] sy = 0;

// call scanfsm to recieve key from keypad
scanfsm m1(clk, reset, c0, c1, c2, c3, key);

// call xyz to decode with key

// shift digit displayed



//oscilate selector variable
hsoscEnable m2(clk, selector); // create selector signal
 
// deliver sy
mux2 m3(s1, s2, selector, sy);

// pass sy to read into hex output
sevensegments m4(sy, segOut);

// call led sum
sum2 m5(s1, s2, led);

assign selector2 = ~selector; 

endmodule
