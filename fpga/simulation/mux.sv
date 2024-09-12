// Victoria Parizot
// vparizot@g.hmc.edu
// 09/09/2024

// descr: 2-1 mux

module mux (
	input logic [3:0] s1, s2,
	input logic selector,
	output logic [3:0] sy);

	assign sy = selector? s1:s2;

endmodule
