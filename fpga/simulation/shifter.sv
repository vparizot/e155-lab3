module shifter(
	input logic clk, reset,
	input logic [3:0] keyDebounced,
	output logic [3:0] s1, s2
);

always_ff @(posedge clk)
begin
	if (reset) begin
		s1 <= 0;
		s2 <= 0;
	end
	if (s1 != keyDebounced) begin
		s2 <= s1;
		s1 <= keyDebounced;
	end
end
endmodule
