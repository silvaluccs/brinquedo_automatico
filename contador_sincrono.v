/*
modulo responsavel pelo contador sincrono ele conta as açoes do cachorro, indo de 0 a 5.
*/

module contador_sincrono(clock_in, reset, bits_out, power);
 input clock_in, reset, power;
 output [2:0] bits_out;
 
 
 wire [2:0] proximo,  control_aux;
 wire [2:0] atual;
 wire notPower;
 
 not NotPower(notPower, power);

 
 controle controle_instan(proximo, control_aux, reset, notPower); // chamando o modulo de controle do ffD
 control_reset contr_instan(control_aux, atual, reset); // chamando o modulo que detecta um pulso no botao de reset
 
 FF_d Ff_A(proximo[2], clock_in, atual[2]); // chama o FFD para o MSB
 FF_d Ff_B(proximo[1], clock_in, atual[1]);
 FF_d Ff_C(proximo[0], clock_in, atual[0]); // chama o FFD para o LSB

 assign bits_out = proximo;
 
endmodule

/*
Modulo responsavel pelo controle do proximo estado do FFD
*/

module controle(Entrada, Saida, reset, notPower);
 input reset, notPower;
 input [2:0] Entrada;
 output [2:0] Saida;
 
 // controle do FF0
 wire notC, nandAB, and0AB, CFinal;
 not NotC(notC, Entrada[0]);
 nand NAND_AB(nandAB, Entrada[2], Entrada[1]);
 and and0(and0AB, nandAB, notC);
 or OR3(CFinal, reset, and0AB);

 mux_2x1_gl muxC(CFinal, 1'b0, notPower, Saida[0]); // mux para caso o power esteja desativado
 
 // controle do FF1
 wire notA, xorBC, notReset, and1ABC, BFinal;
 not not_(notReset, reset);
 not NotA(notA, Entrada[2]);
 xor Xor0(xorBC, Entrada[1], Entrada[0]);
 
 and and1(and1ABC, notA, xorBC);
 and AND3(BFinal, notReset, and1ABC);
 mux_2x1_gl muxB(BFinal, 1'b0, notPower, Saida[1]); // mux para caso o power esteja desativado
 
 // controle do FF2
 wire notB, andANotsBC, andBCnotA, OrABCout, AFinal;
 not NotB(notB, Entrada[1]);
 and and2(andANotsBC, Entrada[2], notB, notC);
 and and3(andBCnotA, notA, Entrada[1], Entrada[0]);
 or Or0(OrABCout, andBCnotA, andANotsBC);
 or OR2(AFinal, OrABCout, reset);
 mux_2x1_gl muxA(AFinal, 1'b0, notPower, Saida[2]); // mux para caso o power esteja desativado
 
 endmodule
 
/*
modulo responsavel por detectar se o botao reset foi apertado
*/
 
module control_reset(Entrada, Saida, reset);
    input reset;
    input [2:0] Entrada; // Estado atual
    output reg [2:0] Saida;

    always @(*) begin
        if (reset) begin
            Saida = 3'b101; // Se reset estiver ativo, vá para 000
        end else begin
            Saida = Entrada; // Caso contrário, mantenha o estado atual
        end
    end
endmodule