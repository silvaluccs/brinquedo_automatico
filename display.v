/*
Modulo responsavel por configurar os segmentos para exibir o movimento atual do cachorro
*/

module display(bit0, bit2, bit1,  a, b, c, d, e, f, g, p);
 input bit2, bit1, bit0; // bit0 eh o msb	
 output a, b, c, d, e, f, g, p;
 
 segA  segA_instan(.out(a), .A(bit0), .B(bit1), .C(bit2));
 segB	segB_instan(.out(b), .A(bit0), .B(bit1), .C(bit2));
 segC segC_instan(.out(c), .A(bit0), .B(bit1), .C(bit2));
 segD segD_instan(.out(d), .A(bit0), .B(bit1), .C(bit2));
 segE segE_instan(.out(e), .A(bit0), .B(bit1), .C(bit2));
 segF segF_instan(.out(f), .A(bit0), .B(bit1), .C(bit2));
 segG segG_instan(.out(g), .A(bit0), .B(bit1), .C(bit2));
 assign p = 1'b1;
endmodule

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

/*
Modulo responsavel pelo segmento b do display de 7 segmentos
*/

module segB(out, A, B, C);
	input A, B, C;
	output out;
	
	wire xorBC;
	
	xor Xor0(xorBC, B, C);
	and And0(out, xorBC, A);
	
endmodule

/*
Modulo responsavel pelo segmento c do display de 7 segmentos
*/

module segC(out, A, B, C);
	input A, B, C;
	output out;
	wire notA, notC;
	
	not not0(notA, A);
	not not1(notC, C);
	and and0(out, notA, B, notC);
	
endmodule

/*
Modulo responsavel pelo segmento d do display de 7 segmentos
*/
module segD(out, A, B, C);

	input A, B, C;
	output out;

	wire NotxorBC, notA, AndXorA, notB, AndNotsAB;
	
	xnor Xnor0(NotxorBC, B, C);
	and And0(AndXorA, NotxorBC, A);
	
	not Not0(notA, A);
	not Not1(notB, B);
	
	and And1(AndNotsAB, notA, notB, C);
	
	or Or0(out, AndNotsAB, AndXorA);
	

endmodule

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

/*
Modulo responsavel pelo segmento g do display de 7 segmentos
*/

module segG(out, A, B, C);

input A, B, C;
output out;

wire notA, notB, AndNots, AndABC;

not Not0(notA, A);
not Not1(notB, B);
and And0(AndNots, notA, notB);
and And1(AndABC, A, B, C);

or Or0(out, AndABC, AndNots);
endmodule