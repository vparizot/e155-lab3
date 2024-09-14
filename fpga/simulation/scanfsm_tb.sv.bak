// Victoria Parizot
// vparizot@g.hmc.edu
// 09/09/2024

// descr: testbench for mux module of lab 2

`timescale 1ns/1ns

module scanfsm_tb();
 // Set up test signals
	
	logic clk, reset;
	logic c0, c1, c2, c3;
	//logic [3:0] r;
	logic [3:0] keyDecoded, keyDecoded_expected;
	logic keyPressed;


 // Instantiate the device under test
 scanfsm dut(.clk(clk), .reset(reset), .c0(c0), .c1(c1), .c2(c2), .c3(c3), .keyDecoded(keyDecoded), .keyPressed(keyPressed));

 // Generate clock signal with a period of 10 timesteps.
 always
   begin
     clk = 1; #5;
     clk = 0; #5;
   end
  
 // At the start of the simulation:
 //  - Load the testvectors
 //  - Pulse the reset line (if applicable)
 initial
   begin
   	reset = 1; #20
	reset = 0; #20
	
	c0 = 0;
	c1 = 0;
	c2 = 0;
	c3 = 0;
	//key_expected = 0000_0000;

	#100;

	c0 = 0;
	c1 = 1;
	c2 = 0;
	c3 = 0;

	#100;
	c0 = 0;
	c1 = 0;
	c2 = 0;
	c3 = 0;

	#100;
	c0 = 1;
	c1 = 0;
	c2 = 0;
	c3 = 0;



	
	
   end
endmodule
