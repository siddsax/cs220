module eq2 ( A2 ,B2 ,equal2);

output equal2 ;

input [1:0] A2;
input [1:0] B2 ;


assign equal2   = (A2==B2) ? 1 : 0;

endmodule





module test_eq2;
   reg [1:0] A2;
   reg [1:0] B2;
   wire Equal2;
   eq2 uut(.A2(A2), .B2(B2), .equal2(Equal2));
      
   initial begin
      A2=2'b11;
      B2=2'b11;
      
       $monitor(Equal2);
   end
endmodule


