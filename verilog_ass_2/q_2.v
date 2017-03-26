module counter
(
	clk,
	reset,
	result,
	init,
	set
);

	input clk;
	input reset;
	input set;
	input [3:0] init;
	output [3:0] result;

	reg [3:0] result;
	reg [3:0] store;
  // reg clk_last = clk;
	always @(posedge clk or posedge reset or posedge set)
	begin
		if (reset) 
			result = 0;		
		else if (set)
		  result = init;
		else
		  result = result + 1;
	end
endmodule	