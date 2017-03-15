module test_eq2;
   reg [1:0] A2;
   reg [1:0] B2;
   wire Equal2;
   eq2 uut(.A2(A2), .B2(B2), .Equal2(Equal2));
   initial begin
			A2[0] = 0;
			A2[1] = 0;
			B2[0] = 0;
			B2[1] = 0;
      $monitor(Equal2);
   end
endmodule