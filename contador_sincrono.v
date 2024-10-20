module contador_sincrono(clock, reset, bits_out);
 input clock, reset;
 output [2:0] bits_out;
 
 wire [2:0] atual, proximo;
 
 controle controle_instan(proximo, atual, reset);
 FF_d Ff_A(proximo[2], clock, atual[2]);
 FF_d Ff_B(proximo[1], clock, atual[1]);
 FF_d Ff_C(proximo[0], clock, atual[0]);
// msb 2 lsb 0
 assign bits_out = proximo;
 
endmodule

module controle(Entrada, Saida, reset);
 input reset;
 input [2:0] Entrada; // 0 = C, 1 = B, 2 = C
 output [2:0] Saida;
 
 // controle do c
 wire notC, nandAB, and0AB;
 not NotC(notC, Entrada[0]);
 nand NAND_AB(nandAB, Entrada[2], Entrada[1]);
 and and0(and0AB, nandAB, notC);
 or OR3(Saida[0], reset, and0AB);
 
 // controle do b
 wire notA, xorBC, notReset, and1ABC;
 not not_(notReset, reset);
 not NotA(notA, Entrada[2]);
 xor Xor0(xorBC, Entrada[1], Entrada[0]);
 
 and and1(and1ABC, notA, xorBC);
 and AND3(Saida[1], notReset, and1ABC);
 
 // controle do a
 wire notB, andANotsBC, andBCnotA, OrABCout;
 not NotB(notB, Entrada[1]);
 and and2(andANotsBC, Entrada[2], notB, notC);
 and and3(andBCnotA, notA, Entrada[1], Entrada[0]);
 or Or0(OrABCout, andBCnotA, andANotsBC);
 or OR2(Saida[2], OrABCout, reset);

 endmodule 