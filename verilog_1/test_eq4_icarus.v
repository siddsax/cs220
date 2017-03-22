module test_eq4;
   reg [3:0] A2;
   reg [3:0] B2;
   wire Equal2;
   eq4 uut(.A3(A2), .B3(B2), .Equal3(Equal2));
   initial begin
			A2[0] = 0;
			A2[1] = 1;
			A2[2] = 0;
			A2[3] = 0;
			B2[0] = 0;
			B2[1] = 0;
			B2[2] = 0;
			B2[3] = 0;	
      $monitor(Equal2);
   end
endmodule