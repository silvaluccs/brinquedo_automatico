/*
Modulo responsavel pelo contador de tempo de aproximadamente 8 segundos
*/

module contador(a, b, c, d, e, f, g, clock_entrada, botao);

	input clock_entrada, botao;
	output a, b, c, d, e, f, g;
	wire  bit0, bit1, bit2;
	
	divisor_frequencia dividirfreq(.bit0(bit2), .bit1(bit1), .bit2(bit0), .clock_entrada(clock_entrada), .botao(botao));
	
	// instancia dos segmentos do display de 7 segmentos
	segA  segA_instan(.out(a), .A(bit0), .B(bit1), .C(bit2));
	segB	segB_instan(.out(b), .A(bit0), .B(bit1), .C(bit2));
	segC 	segC_instan(.out(c), .A(bit0), .B(bit1), .C(bit2));
	segD 	segD_instan(.out(d), .A(bit0), .B(bit1), .C(bit2));
	segE 	segE_instan(.out(e), .A(bit0), .B(bit1), .C(bit2));
	segF 	segF_instan(.out(f), .A(bit0), .B(bit1), .C(bit2));
	segG 	segG_instan(.out(g), .A(bit0), .B(bit1), .C(bit2));
		
endmodule