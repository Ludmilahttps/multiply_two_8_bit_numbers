.org 0024h

JZ mult
mult: 
    IN 00H ;Move os dados da porta de entrada para o acumulador
    MOV B,A ;O conteúdo do registrador A é movido para o registrador B
    IN 01H ;Move os dados da porta de entrada para o acumulador
    MOV D,A ;O conteúdo do registrador A é movido para o registrador D
    MVI A,00H ;Zera o acumulador
    MVI C,00H ;Zera o registrador C
L1: ADD B ;Adiciona o conteúdo de B no acumulador
    JC L2 ;Pula para L2 se tiver carry
    DCR D ;Decrementa 1 em D
    JNZ L1 ;Pula para L1 se não for zero
    JMP L3 ;Pula para o L3
L2: INR C ;Incrementa 1 em C
    DCR D ;Decrementa 1 em D
    JNZ L1 ;Pula para L1 se não for zero
L3: OUT 01H ;Move os dados para a porta de saída 01H
    MOV A,C ;O conteúdo do registrador C é movido para o registrador A
    OUT 00H ;Move os dados de C para a porta de saida 00H
    JZ mult ;Pula pro inicio se zero