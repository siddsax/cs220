module eq1(A1, B1, Equal1);
	input A1;
	input B1;
	wire A1;
	wire B1;
	output Equal1;
	wire Equal1;
	assign Equal1 = (A1==B1);
endmodule

module eq2(A2,B2,Equal2);
	input [1:0] A2;
	input [1:0] B2;
	wire [1:0] A2;
	wire [1:0] B2;
	output Equal2;
	wire Equal2;
	wire e1, e2;
	eq1 forFirstBit( .A1(A2[1]), .B1(B2[1]), .Equal1(e2));
	eq1 forSecondBit( .A1(A2[0]), .B1(B2[0]), .Equal1(e1));
	assign Equal2 = (e1 & e2);
endmodule
