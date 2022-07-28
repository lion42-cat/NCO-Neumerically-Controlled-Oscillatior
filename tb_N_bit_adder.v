module tb_N_bit_adder;
 // Inputs
 reg [31:0] input1;
 reg [31:0] input2;
 // Outputs
 wire [31:0] answer;

 N_bit_adder uut (
  .input1(input1), 
  .input2(input2), 
  .answer(answer)
 );

 initial begin
  input1 = 4232;
  input2 = 4232;
  #100;
  input1 = 2424;
  input2 = 3355;
  #100;
  input1 = 1000;
  input2 = 1111;
  #100;
 end
      
endmodule


