module Impressora(
	input [15:0] valor,
	output reg[6:0] HEX3,
	output reg[6:0] HEX2,
	output reg[6:0] HEX1,
	output reg[6:0] HEX0);
	
	always @ (posedge valor) begin
		if (valor <= 9999) begin
			reg[15:0] unidade;
			reg[15:0] dezena;
			reg[15:0] centena;
			reg[15:0] milhar;
			unidade = valor % 10;
			dezena = ((valor - unidade) / 10) % 10;
			centena = ((valor - (dezena * 10) - unidade) / 100) % 10;
			milhar = ((valor - (centena * 100) - (dezena * 10) - unidade)) / 1000;
			
			case (milhar)
				1'd0: HEX3 = 7'b1000000;
				1'd1: HEX3 = 7'b1111001;
				1'd2: HEX3 = 7'b0100100;
				1'd3: HEX3 = 7'b0110000;
				1'd4: HEX3 = 7'b0011001;
				1'd5: HEX3 = 7'b0011001;
				1'd6: HEX3 = 7'b0000010;
				1'd7: HEX3 = 7'b1111000;
				1'd8: HEX3 = 7'b0000000;
				1'd9: HEX3 = 7'b0010000;
				default: HEX3 = 7'b1000000;
			endcase
			
			case (centena)
				1'd0: HEX2 = 7'b1000000;
				1'd1: HEX2 = 7'b1111001;
				1'd2: HEX2 = 7'b0100100;
				1'd3: HEX2 = 7'b0110000;
				1'd4: HEX2 = 7'b0011001;
				1'd5: HEX2 = 7'b0011001;
				1'd6: HEX2 = 7'b0000010;
				1'd7: HEX2 = 7'b1111000;
				1'd8: HEX2 = 7'b0000000;
				1'd9: HEX2 = 7'b0010000;
				default: HEX2 = 7'b1000000;
			endcase
			
			case (dezena)
				1'd0: HEX1 = 7'b1000000;
				1'd1: HEX1 = 7'b1111001;
				1'd2: HEX1 = 7'b0100100;
				1'd3: HEX1 = 7'b0110000;
				1'd4: HEX1 = 7'b0011001;
				1'd5: HEX1 = 7'b0011001;
				1'd6: HEX1 = 7'b0000010;
				1'd7: HEX1 = 7'b1111000;
				1'd8: HEX1 = 7'b0000000;
				1'd9: HEX1 = 7'b0010000;
				default: HEX1 = 7'b1000000;
			endcase
			
			case (unidade)
				1'd0: HEX0 = 7'b1000000;
				1'd1: HEX0 = 7'b1111001;
				1'd2: HEX0 = 7'b0100100;
				1'd3: HEX0 = 7'b0110000;
				1'd4: HEX0 = 7'b0011001;
				1'd5: HEX0 = 7'b0011001;
				1'd6: HEX0 = 7'b0000010;
				1'd7: HEX0 = 7'b1111000;
				1'd8: HEX0 = 7'b0000000;
				1'd9: HEX0 = 7'b0010000;
				default: HEX0 = 7'b1000000;
			endcase
			
		end
		else begin
			HEX3 = 7'b0111111;
			HEX2 = 7'b0111111;
			HEX1 = 7'b0111111;
			HEX0 = 7'b0111111;
		end
	end
	
endmodule