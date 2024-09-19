// Victoria Parizot
// vparizot@g.hmc.edu
// 09/19/2024

// descr: decodes the row and column pairs into the decoded key value

module scanDecoder(
	input logic [3:0] r,
	input logic c0,c1,c2,c3,
	output logic [3:0] keyDecoded);

always_comb begin
		case ({r, c0, c1, c2, c3}) 
		  //format: {r3,r2,r1,r0,c0,c1,c2,c3}
			{4'b0001 , 1'b0 , 1'b1 , 1'b0 , 1'b0}: keyDecoded = 4'b0000;
			{4'b1000, 1'b1, 1'b0, 1'b0, 1'b0}: keyDecoded = 4'b0001;
			{4'b1000, 1'b0, 1'b1, 1'b0, 1'b0}: keyDecoded = 4'b0010;
			{4'b1000, 1'b0, 1'b0, 1'b1, 1'b0}: keyDecoded = 4'b0011;
			{4'b0100, 1'b1, 1'b0, 1'b0, 1'b0}: keyDecoded = 4'b0100;
			{4'b0100, 1'b0, 1'b1, 1'b0, 1'b0}: keyDecoded = 4'b0101;
			{4'b0100, 1'b0, 1'b0, 1'b1, 1'b0}: keyDecoded = 4'b0110;
			{4'b0010, 1'b1, 1'b0, 1'b0, 1'b0}: keyDecoded = 4'b0111;
			{4'b0010, 1'b0, 1'b1, 1'b0, 1'b0}: keyDecoded = 4'b1000;
			{4'b0010, 1'b0, 1'b0, 1'b1, 1'b0}: keyDecoded = 4'b1001;
			{4'b0001, 1'b1, 1'b0, 1'b0, 1'b0}: keyDecoded = 4'b1010;
			{4'b0001, 1'b0, 1'b0, 1'b1, 1'b0}: keyDecoded = 4'b1011;
			{4'b1000, 1'b0, 1'b0, 1'b0, 1'b1}: keyDecoded = 4'b1100;
			{4'b0100, 1'b0, 1'b0, 1'b0, 1'b1}: keyDecoded = 4'b1101;
			{4'b0010, 1'b0, 1'b0, 1'b0, 1'b1} : keyDecoded = 4'b1110;
			{4'b0001, 1'b0, 1'b0, 1'b0, 1'b1} : keyDecoded = 4'b1111;
			default: keyDecoded = 4'b1111;
		endcase
	end
endmodule