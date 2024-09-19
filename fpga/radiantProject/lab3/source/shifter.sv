// Victoria Parizot
// vparizot@g.hmc.edu
// 09/19/2024

// descr: updates seven seg display, shifts value over

module shifter(
	input logic clk, reset, enabled,
	input logic [3:0] keyDecoded,
	output logic [3:0] s1, s2
);

always_ff @(posedge clk)
begin
	if (reset == 0) begin
		s2 <= 0;
		s1 <= 0;
	end
	else if (enabled) begin
		s1 <= s2;
		s2 <= keyDecoded;
	end
end
endmodule