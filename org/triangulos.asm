		.data
msg_base:   .ascii "Insira o valor de \0"
msg_a:      .ascii "A: \n\0"
msg_b:      .ascii "B: \n\0"
msg_c:      .ascii "C: \n\0"
msg_faz:    .ascii "FAZ TRIANGULO \n\0"
msg_nfaz:   .ascii "NÃO FAZ TRIANGULO \n\0"

    .text
main:

    #LENDO PRIMEIRO VALOR
    li  a7, 4
    la  a0, msg_base
    ecall
    la  a0, msg_a
    li  a7, 4
    ecall

    li  a7, 5
    ecall
    mv a1, a0

    #LENDO SEGUNDO VALOR
    li  a7, 4
    la  a0, msg_base
    ecall
    la  a0, msg_b
    ecall

    li  a7, 5
    ecall
    mv a2, a0

    #LENDO TERCEIRO VALOR
    li  a7, 4
    la  a0, msg_base
    ecall
    la  a0, msg_c
    ecall

    li  a7, 5
    ecall

faz_triangulo:

    call maior

    add s0, a1, a2
    slt s1, a0, s0
    li a7, 4

    blt a0, s0 fez_triangulo

    la, a0, msg_nfaz
    ecall
    j fim

fez_triangulo:
    la, a0, msg_faz
    ecall
    j fim


fim:
    #FINALIZA
    li a7, 10
    ecall

maior:
    #COLOCA O MAIOR EM a0 E OS DEMAIS EM a1 E a2

    mv s3, a0
    mv s4, a1
    mv s5, a2

    bgt a1, s3, corpo_1
    bgt a2, s3, corpo_2
    j fim_maior
corpo_1:
    mv s4, s3
    mv s3, a1
    bgt a2, s3, corpo_2
    mv s5, a2
    j fim_maior
corpo_2:
    mv s5, s3
    mv s3, a2
    j fim_maior
fim_maior:
    mv a0, s3
    mv a1, s4
    mv a2, s5
    ret
    
    