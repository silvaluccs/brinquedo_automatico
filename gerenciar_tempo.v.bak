module gerenciar_tempo(out, A, B, C, D, E); // A msb e C lsb. 
 input A, B, C, D, E;
 output out;
 
 wire notD, andCnotDE, notE, andBCDnotE, andABCE;
 
 not Not_d(notD, D);
 and And0(andCnotDE, notD, C, E);
 
 not Not_e(notE, E);
 and And1(andBCDnotE, B, C, D, notE);
 
 and And2(andABCE, A, B, C, E);
 
 or Or0(out, andCnotDE, andBCDnotE, andABCE);
endmodule