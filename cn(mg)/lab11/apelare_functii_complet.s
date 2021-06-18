# Calcularea functiei X^y

.data

    x: .word 3
    y: .word 2

.text
.globl main

main:
    lw $a0, x # Incarca x si y
    lw $a1, y

    jal power # Jump and link catre functia power

    move $a0, $t1
    li $v0, 1
    syscall

    #exit
    li $v0, 10
    syscall
.end main

# Functia care calculeaza x^y
.globl power

power:
    # Valori de start pentru bucla
    li $t1, 1
    li $t0, 0

    bucla:
        mul $t1, $t1, $a0
        add $t0, $t0, 1
        blt $t0, $a1, bucla

    jr $ra
.end power
