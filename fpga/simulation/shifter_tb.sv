
module shifter_tb();
	logic clk, reset;
	logic [3:0] keyDebounced;
	logic [3:0] s1, s2;

shifter dut( .clk(clk), .reset(reset), .keyDebounced(keyDebounced), .s1(s1), .s2(s2));

always
	begin
	clk = 1; #1;
	clk = 0; #0;
	end

initial 
	begin
	reset = 1; #20;
	reset = 0; #20;
	keyDebounced = 0100; #10;
	keyDebounced = 0010; #10;
	keyDebounced = 0100; #10;
	keyDebounced = 0010; #10;
	keyDebounced = 0100; #10;
	keyDebounced = 0010; #10;
	keyDebounced = 0100; #10;
	keyDebounced = 0010; #10;

	end
endmodule