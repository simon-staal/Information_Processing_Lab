module task1_top (
		SW,		// input switches
		HEX0		//Hex output on 7 segment display
	);
	
	input [3:0] SW; // Declare input/output ports
	output [6:0] HEX0;
	
	hex_to_7seg SEG0 (HEX0, SW[3:0]);
	
endmodule