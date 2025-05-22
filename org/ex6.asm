    .data

msg_acerto:   .ascii "\nACERTOU! \n\0"
msg_erro:     .ascii "\nERROU! \n\0"
msg_insira:   .ascii "Insira um valor: \0"
msg_v2:      .ascii "Valor random: \0"

    .text

main:

    li a7, 4
    la a0, msg_insira
    ecall

    li a7, 5
    ecall

    call Joga
    j fim

Joga:

    mv t6, ra
    mv s1, a0
    addi a0, zero, 10

    call randnum
    mv t2, a0

    li a7, 4
    la a0, msg_v2
    ecall

    mv a0, t2
    li a7, 1
    ecall

    li a7, 4
    beq s1, t2, acerto
    la a0, msg_erro
    ecall
    
    mv ra, t6
    ret

acerto:
    la a0, msg_acerto
    ecall
    j fim

randnum:
    addi sp, sp, -4
    sw ra, 0(sp)
    mv a1, a0
    li a7, 42
    ecall
    lw ra, 0(sp)
    addi sp, sp, 4
    ret

fim:
    li a7, 10
    ecall