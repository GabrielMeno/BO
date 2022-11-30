module EquacaoSegundoGrau(
	input [9:0] SW,
	output [6:0] HEX3,
	output [6:0] HEX2,
	output [6:0] HEX1,
	output [6:0] HEX0);
	
	parameter a = 16'b0000000000000001;
	parameter b = 16'b0000000000000001;
	parameter c = 16'b0000000000000001;
	parameter x = 4'b0001;
	
	// Utilizar para simular o bloco de controle
	// clock = SW[0]
	// reset = SW[1]
	// lx 	= SW[2]
	// m0 	= SW[3]
	// m1 	= SW[4]
	// m2 	= SW[5]
	// h  	= SW[6]
   // ls 	= SW[7]
	// lh 	= SW[8]
	wire [15:0] resultado;
	BlocoOpeartivo blocoOperativo(SW[0], SW[1], x, SW[2], a, b, c, SW[3], SW[4], SW[5], SW[6], SW[7], SW[8], resultado);
	Impressora impressora(resultado, HEX3, HEX2, HEX1, HEX0);
	
	// Utilizar quando o bloco de controle for implementado
	//wire lx;
	//wire m0;
	//wire m1;
	//wire m2;
	//wire h;
	//wire ls;
	//wire lh;
	//wire [15:0] resultado;
	//BlocoOpeartivo blocoOperativo(clock, reset, x, lx, a, b, c, m0, m1, m2, h, ls, lh, resultado);
	//Impressora impressora(resultado, HEX3, HEX2, HEX1, HEX0);
	
endmodule