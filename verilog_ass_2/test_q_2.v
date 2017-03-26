module test_q_2;
   reg [3:0] init;
   reg clk;
   reg reset;
   reg set;
   wire [3:0] result;
   counter uut(.clk(clk), .reset(reset), .set(set), .result(result), .init(init));
   initial begin
			init[0] = 1;
			init[1] = 1;
			init[2] = 0;
			init[3] = 1;
      reset = 0;
			set = 1;
			// $monitor(init);
			clk = 1;
			#1000000000
			set = 0;
			#1000000000			
			// $monitor(result);
			clk = 0;
			clk = 1;
			#1000000000
			// $monitor(result);
			clk = 0;
			clk = 1;
			#1000000000
			// $monitor(result);

   end
endmodule
