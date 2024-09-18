module shifter(
	input logic clk, reset, enabled,
	input logic [3:0] keyDecoded,
	output logic [3:0] s1, s2
);



always_ff @(posedge clk)
begin
	if (reset == 0) begin
		s1 <= 0;
		s2 <= 0;
	end
	else if (enabled) begin
		s2 <= s1;
		s1 <= keyDecoded;
	end
end
endmodule