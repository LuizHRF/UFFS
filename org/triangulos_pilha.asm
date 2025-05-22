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

    addi sp, sp, -12  ##(pilha -12 -> cria 3 espaços)
    sw a0, 0(sp)
    sw a1, 4(sp)
    sw a2, 8(sp)

    call faz_triangulo

    li a7, 4
    bne a0, zero, fez_triangulo

    la a0, msg_nfaz
    ecall
    j fim

fez_triangulo:

    la, a0, msg_faz
    ecall

fim:
    #FINALIZA
    li a7, 10
    ecall

faz_triangulo:

    lw s0, 0(sp)
    lw s1, 4(sp)
    lw s2, 8(sp)
    addi sp, sp, 12  ##(pilha +12 -> libera 3 espaços)
    
    add t0, s0, s1
    add t1, s0, s2
    add t2, s1, s2

    blt t0, s2, nao_faz
    blt t1, s1, nao_faz
    blt t2, s0, nao_faz

    li a0, 1
    ret    

nao_faz:
    li a0, 0
    ret