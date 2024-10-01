/*
Modulo responsavel pelo segmento a do display de 7 segmentos
*/

module segA(out, A, B, C);
	input A, B, C;
	output out;
	
	wire xorAC, notB;
	
	not not0(notB, B);
	xor Xor0(xorAC, A, C);
	and And0(out, xorAC, notB);
endmodule