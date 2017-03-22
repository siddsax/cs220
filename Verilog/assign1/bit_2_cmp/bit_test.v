`include "bit_one_cmp.v"
module test;
reg	[3:0] X;
reg [1:0]check;

wire eq;
bit_four_cmp two_bits(.X(X),.check(check),.eq(eq) );
initial begin
	X= 4'b1111;
	check=2'b01;
	check =2'b00;
	X= 4'b1110;
	check=2'b10 ;
	check=0;
end

endmodule