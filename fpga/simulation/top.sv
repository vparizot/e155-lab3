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

// flipflops for inputs

// call scanfsm to recieve decoded key from keypad
scanfsm m1(clk, reset, c0, c1, c2, c3, decodedKey);

// check decodedKey for switch bouncing



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
