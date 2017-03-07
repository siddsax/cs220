module SINBIT(A1, B1, Equal1);
	input A1,B1;
	output Equal1;
	assign Equal1 = (A1==B1);
endmodule

module TWOBIT(A2,B2,Equal2);
	input [1:0] A2,B2;
	output Equal2;
	reg eq1, eq2;
	SINBIT forFirstBit( .A1(A2[1]), .B1(B2[1]), .Equal1(eq2));
	SINBIT forSecondBit( .A1(A2[0]), .B1(B2[0]), .Equal1(eq1));
	assign Equal2 = (eq1 & eq2);
endmodule
