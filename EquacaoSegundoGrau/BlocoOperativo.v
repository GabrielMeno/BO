module BlocoOpeartivo(
	input clock,
	input reset,
	input [3:0] x,
	input lx,
	input [15:0] a,
	input [15:0] b,
	input [15:0] c,
	input [1:0] selecaoM0,
	input [1:0] selecaoM1,
	input [1:0] selecaoM2,
	input h,
	input ls,
	input lh,
	output [15:0] resultado);
	
	wire [15:0] saidaM0;
	wire [15:0] saidaM1;
	wire [15:0] saidaM2;
	wire [15:0] saidaX;
	wire [15:0] saidaUla;
	wire [15:0] saidaRegH;
	wire [15:0] saidaRegS;
	
	wire [15:0] entrada = {12'b000000000000, x};
	Registrador16 regX(clock, reset, lx, entrada, saidaX);

	Multiplexador m0(16'b0000000000000000, a, b, c, selecaoM0, saidaM0);
	Multiplexador m1(saidaM0, saidaX, saidaRegS, saidaRegH, selecaoM1, saidaM1);
	Multiplexador m2(saidaX, saidaM0, saidaRegS, saidaRegH, selecaoM2, saidaM2);
	
	UnidadeLogicaAritmetica ula(saidaM1, saidaM2, h, saidaUla);
	
	Registrador16 regS(clock, reset, ls, saidaUla, saidaRegS);
	Registrador16 regH(clock, reset, lh, saidaUla, saidaRegH);
	
	assign resultado = saidaRegS;
	
endmodule