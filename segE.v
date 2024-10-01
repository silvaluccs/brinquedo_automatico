/*
Modulo responsavel pelo segmento e do display de 7 segmentos
*/

module segE(out, A, B, C);
	input A, B, C;
	output out;
	
	wire notB, notC, andABC;
	
	not Not0(notB, B);
	not Not1(notC, C);
	and And0(andABC, notB, notC, A);
	or Or0(out, C, andABC);
endmodule
