module eq1(A1, B1, Equal1);
  input A1,B1;
  output Equal1;
  assign Equal1 = (A1==B1);
endmodule

module eq2(A2,B2,Equal2);
  input [1:0] A2,B2;
  output Equal2;
  reg e1, e2;
  eq1 forFirstBit( .A1(A2[1]), .B1(B2[1]), .Equal1(e2));
  eq1 forSecondBit( .A1(A2[0]), .B1(B2[0]), .Equal1(e1));
  assign Equal2 = (e1 & e2);
endmodule

module comparemod (A, B, flag);
  input [4:0] A, B;
  output flag;
  reg flag;
  always @(A or B)
  begin
  flag = 0;
  if(A == B) 
  flag = 1;
  end
  endmodule

module blink(
  clk,  // clock signal
  ledpin  // LED pin
    );

  // inputs and outputs
  input clk;

  output ledpin;
  reg ledpin = 0; 

  // internal variable
  reg [25:0] counter = 50_000_000;  // 26 bit variable

  always @(posedge clk)
  if (counter == 0) begin     // at 1 second
    counter <= 50_000_000;    // reset counter
    ledpin <= !ledpin;    // invert ledpin
  end else begin
    counter <= counter - 1;   // decrease
  end

endmodule