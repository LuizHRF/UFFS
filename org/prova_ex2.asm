        .data
    vet : .word 1, 2, 0, -1, -2, 1, 1, 0, 0, 0, 0

        .text
    main:
        la a0, vet # Load address of vet into a0
        li a1, 11 # Load size of vet into a1

        call qtd_elementos

        li      a7, 1
        ecall
        mv      a0, a1
        ecall
        mv      a0, a2
        ecall


        li      a7, 10
        ecall

    qtd_elementos:
        li      t0, 0
        li      t6, 0
        li      t5, 0
        li      t4, 0

    loop:
        beq     t0, a1, fim
        lw      t1, 0(a0)
        bgt     t1, zero, positivo
        blt     t1, zero, negativo
        addi    t5, t5, 1
    loop_2:
        addi    a0, a0, 4
        addi    t0, t0, 1
        j       loop
    positivo:
        addi    t6, t6, 1
        j       loop_2
    negativo:
        addi    t4, t4, 1
        j       loop_2
    fim:
        mv      a0, t6
        mv      a1, t5
        mv      a2, t4
        ret
