

module sevensegments(
	input logic [3:0] sy,
	output logic [6:0] segOut);
// takes in dipswitch as 4 digit binary value and 
// outputs hexidecimal value on seven segment display

always_comb
	begin
		case (sy) 
			4'b0000 : segOut = ~7'b0100011; //1100010; 
			4'b0001 : segOut = ~7'b1111001; //b1111001;
			4'b0010 : segOut = ~7'b0100100; //b0010010;
			4'b0011 : segOut = ~7'b0110000; //b0000110;
			4'b0100 : segOut = ~7'b0011001; //b1001100;
			4'b0101 : segOut = ~7'b0010010; //b0100100;
			4'b0110 : segOut = ~7'b0000010; //b0100000;
			4'b0111 : segOut = ~7'b1111000; //b0001111;
			4'b1000 : segOut = ~7'b0000000; //b0000000;
			4'b1001 : segOut = ~7'b0011000; //b0001100;
			4'b1010 : segOut = ~7'b0100000; //b0000010;
			4'b1011 : segOut = ~7'b0000011; //b1100000;
			4'b1100 : segOut = ~7'b1000110; //b0110001;
			4'b1101 : segOut = ~7'b0100001; //b1100010;
			4'b1110 : segOut = ~7'b0000100; //b0010000;
			4'b1111 : segOut = ~7'b0001110; //b0111000;
			default: segOut = 7'b1111111;
		endcase
	end
endmodule