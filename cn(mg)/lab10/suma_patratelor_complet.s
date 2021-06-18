.text
.globl main

main:
    lw $t0, n
    li $t1, 1 #indice pt bucla (1 to n)
    li $t2, 0 #suma

buclaSumare:
    mul $t3, $t1, $t1 #indice ^ 2
    add $t2, $t2, $t3

    add $t1, $t1, 1
    ble $t1, $t0, buclaSumare

    #afiseaza rezultatul
    move $a0, $t2
    li $v0, 1
    syscall

    #iesire program
    li $v0, 10
    syscall
.end main

.data
    n: .word 3