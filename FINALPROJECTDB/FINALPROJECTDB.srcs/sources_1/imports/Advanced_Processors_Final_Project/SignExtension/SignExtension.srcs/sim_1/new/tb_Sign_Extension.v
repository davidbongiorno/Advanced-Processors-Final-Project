`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/01/2017 06:23:11 PM
// Design Name: 
// Module Name: tb_Sign_Extension
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module tb_sign_extension;

	// Inputs
	reg [15:0] data_in;

	// Outputs
	wire [31:0] data_out;

	// Instantiate the Unit Under Test (UUT)
	Sign_Extension uut (.instruction(data_in), .target_address(data_out));
	
	// parameters of test vectors (outputs = columns - inputs)
	parameter COLUMNS = 48, INPUTS = 16, ROWS = 4; // ROWS should be equal to 2^INPUTS to exhaust all possibilities 
	parameter OUTPUTS = 32;

	// this is how you declare a two dimensional test vector
	reg [COLUMNS-1:0] test_vector [0:ROWS-1];
	// we need a single vector also to make things easy
	reg [COLUMNS-1:0] single_vector;
	integer index;	// and define a variable for an index
	integer mm_count;	// define a variable to count mismatches

	initial begin

		mm_count = 0;	// zero mismatch count

		// first read all of the test vectors from a file into array: test_vector
		$readmemb("sign_extension_tvect.txt", test_vector);
		
		// need to loop over all of the rows using a for loop
		for (index=0; index<ROWS; index=index+1) begin
			// put the vector to test this loop into single_vector
			single_vector = test_vector [index];
			
			// now apply the stimuli to from the vector to the input signals
			data_in = single_vector[COLUMNS-1:COLUMNS-INPUTS];
			//data_out = single_vector[COLUMNS-INPUTS-1:0];
			#10;	// wait 10 ns for input to settle
			// compare to expected value
			if (data_out !== single_vector[OUTPUTS-1:0]) begin
				// display mismatch
				$display("Mismatch--loop index: %d; input: %b, expected: %b, received: %b",
					  index, data_in, single_vector[OUTPUTS-1:0], data_out);

				mm_count = mm_count + 1;	// increment mismatch count

			end
			#10;	// add 10 ns for symmetry
		end	// end of for loop

		// tell designer we're done with the simulation
		if (mm_count == 0) begin
			$display("Simulation complete - no mismatches!!!\n\n");
		end else begin
			$display("Simulation complete - %d mismatches!!!\n\n", mm_count);
		end
		$finish;
		
	end	// end of initial block
      
endmodule
`default_nettype wire
