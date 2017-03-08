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

module eq2(A3,B3,Equal3);
  input [3:0] A3,B3;
  output Equal3;
  reg e_1, e_2;
  eq2 forFirst2Bit( .A2(A3[1:0]), .B2(B3[1:0]), .Equal2(e_2));
  eq1 forSecond2Bit( .A1(A3[3:1]), .B1(B3[3:1]), .Equal2(e_1));
  assign Equal2 = (e_1 & e_2);
endmodule