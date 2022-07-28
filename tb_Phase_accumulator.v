`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//모듈 선언
module tb_Phase_accumulator;
//신호 및 변수 선언
reg clk;
reg reset;
reg [31:0] Phase_accumulator_in;
wire [31:0] Phase_accumulator_out;

//검증대상 호출
Phase_accumulator P_A1 (.clk(clk), .reset(reset),
.Phase_accumulator_in(Phase_accumulator_in), 
.Phase_accumulator_out(Phase_accumulator_out)
);

//신호입력을 통해 검증대상의 결과 확인
always #(1) clk = ~clk;

initial begin
	clk = 0; reset = 1; Phase_accumulator_in=0; //신호 초기화
	#5 reset = 0; Phase_accumulator_in = 1;
    #100 $finish;
end
endmodule
