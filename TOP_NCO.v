`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module TOP_NCO(clk_top, rst_top ,NCO_in ,NCO_out);
input clk_top, rst_top;
input [31:0] NCO_in;
output [7:0] NCO_out;

wire [31:0] Phase_accumulator_out;
wire [3:0] Quantizer32to4_out;

Phase_accumulator Phase_accumulator1(clk_top, rst_top, NCO_in, Phase_accumulator_out);

Quantizer32to4 Quantizer32to4_1(Phase_accumulator_out, Quantizer32to4_out);

sin_rom sin_rom_1(Quantizer32to4_out, NCO_out);


endmodule
