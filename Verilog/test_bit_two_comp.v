module test_eq2;
   reg [1:0] A2;
   reg [1:0] B2;
   wire Equal2;
   bit_two_cmp uut(.A(A2), .B(B2), .eq2(Equal2));
   initial begin
			A2[0] = 0;
			A2[1] = 0;
			B2[0] = 0;
			B2[1] = 0;

			
			#1000000000 

			A2[0] = 1;
			A2[1] = 0;
			B2[0] = 0;
			B2[1] = 0;

			#1000000000 

			A2[0] = 1;
			A2[1] = 0;
			B2[0] = 0;
			B2[1] = 1;

   end
endmodule
