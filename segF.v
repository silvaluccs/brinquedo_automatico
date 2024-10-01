/*
Modulo responsavel pelo segmento f do display de 7 segmentos
*/

module segF(out, A, B, C);

	input A, B, C;
	output out;

	wire xnorAB, andC, notA, andAB;
	
	not Not0(notA, A);
	and And0(andAB, notA, B);

	xnor Xnor0(xnorAB, A, B);
	and And1(andC, xnorAB, C);

	or Or0(out, andAB, andC);
endmodule