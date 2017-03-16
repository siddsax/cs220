`include "bit_one_cmp.v"
module test;
reg	[3:0] a,b;
wire eq;
bit_four_cmp two_bits(.A(a),.B(b),.eq(eq) );
initial begin
	a= 4'b1101;
	b= 4'b1101;
end

endmodule