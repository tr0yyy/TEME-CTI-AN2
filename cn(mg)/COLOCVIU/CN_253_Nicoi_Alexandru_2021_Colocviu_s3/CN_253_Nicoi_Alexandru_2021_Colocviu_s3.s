.data
    matrice: .word 1, 5, 7, 9
         .word 4, 2, 3, 1
         .word 5, 6, 4, 2
         .word 7, 9, 1, 0

    dimensiuneArray: .word 4
    suma: .word 0
    sizeOfWord = 4

.text
.globl main

main:
    la $a0, matrice
    lw $a1, dimensiuneArray
    jal sumaDP
    move $a0, $t0
    li $v0, 1
    syscall
    li $v0, 10
    syscall
.end main

.globl sumaDP

sumaDP:
    li $t0, 0 
    li $t1, 0
    bucla:
        mul $t2, $t1, $a1
        add $t2, $t2, $t1
        mul $t2, $t2, sizeOfWord
        add $t3, $a0, $t2
        lw $t4, ($t3)
        add $t0, $t0, $t4
        add $t1, $t1, 1
        blt $t1, $a1, bucla
    jr $ra
.end sumaDP