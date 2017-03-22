module bit_one_cmp(
	input wire i0,i1,
	output wire eq
	);
	wire p1,p2;
	assign eq = p1 | p2;
	assign p1=i0 & i1;
	assign p2= ~i0 & ~i1;
			
		initial begin
			

			//$monitor(eq); 
		end

endmodule


module bit_two_cmp(
	input [1:0] A,B,
	output wire eq2
	);
	wire e1,e2;
	bit_one_cmp for_first(.i0(A[1]),.i1(B[1]),.eq(e1));
	bit_one_cmp for_sec(.i0(A[0]),.i1(B[0]),.eq(e2));
	assign eq2 = e1 & e2;
	// initial begin
	// 	$monitor(eq2);
	// end
endmodule

module bit_four_cmp(
	input [3:0] X,
	input wire [1:0] check,
	output eq
	);
	reg [3:0] A,B;
	wire e1,e2;
	bit_two_cmp for_first(.A(A[3:2]),.B(B[3:2]),.eq2(e1));
	bit_two_cmp for_sec(.A(A[1:0]),.B(B[1:0]),.eq2(e2));
	assign eq = e1 & e2;
	always @(check) begin
			
		if (check == 2'b01) begin
			A = X;
		end
		if (check==2'b10) begin
			B = X;		
		end
		$monitor(A);
	end
endmodule