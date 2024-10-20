module velocidade_atual(chave1, chave2, display_ativar, d2, d3, d4, a, b, c, d, e, f, g, p);
 input chave1, chave2;
 output display_ativar, d2, d3, d4, a, b, c, d, e, f, g, p;
 
 assign display_ativar = 1'b0;
 assign da = 1'b1;
 assign db = 1'b1;
 assign dc = 1'b1;
 
 seg0 instanA(a, chave1, chave2);
 seg0 instanD(d, chave1, chave2);
 seg0 instanE(e, chave1, chave2);
 
 assign b = 1'b0;
 
 seg1 instanC(c, chave1, chave2);
 seg1 instanF(f, chave1, chave2);
 
 seg2 instanG(g, chave1, chave2);
 
 assign p = 1'b1;
endmodule


module seg0(out, A, B);
input A, B;
output out;

wire notB;
not NotB(notB, B);
and and0(out, notB, A);

endmodule

module seg1(out, A, B);
input A, B;
output out;

wire notA;

not NotA(notA, A);
and And1(out, notA, B);

endmodule

module seg2(out, A, B);
input A, B;
output out;

wire notA, notB;
not NotA(notA, A);
not NotB(notB, B);
and And2(out, notA, notB);

endmodule
