.data

    sir: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
    lungime: .word 10
    nl: .asciiz "\n"
    space: .asciiz " "

.text
.globl main

main:
    # Bucla pentru incarcarea (Push) valorilor in stiva
    la $t0, sir # Adresa de inceput a sirului
    li $t1, 0 # Indice bucla i = 0
    lw $t2, lungime

citire1:
    # Afiseaza elementul [i] din sir
    lw $a0, ($t0)
    li $v0, 1
    syscall

    # Afiseaza spatiu
    li $v0, 4
    la $a0, space
    syscall

    add $t1, $t1, 1 # i++
    add $t0, $t0, 4 # Incrementeaza adresa
    blt $t1, $t2, citire1 # Daca nu a depasit lungimea

    # Resetare valori
    la $t0, sir
    li $t1, 0 # Indice bucla i = 0

push:
    lw $t4, ($t0) # Ia elementul [i] din array
    subu $sp, $sp, 4 # Decrementeaza stiva
    sw $t4, ($sp) # Incarca elementul [i] in stiva

    add $t1, $t1, 1 # i++
    add $t0, $t0, 4 # Incrementeaza adresa din sir
    blt $t1, $t2, push # Continua daca i < lungime

## Bucla pentru a scoate (pop) elementele din stiva si a le baga inapoi in sir
    la $t0, sir # Adresa de inceput a sirului
    li $t1, 0 # Indicele buclei, i = 0
    # lw %t2, lungime -> nu va mai fi nevoie de aceasta linie

pop:
    lw $t4, ($sp)
    addu $sp, $sp, 4
    sw $t4, ($t0)

    add $t1, $t1, 1
    add $t0, $t0, 4
    blt $t1, $t2, pop # daca i< lungime
##

    # Resetare valori
    la $t0, sir
    li $t1, 0 # Indice bucla i = 0

    # Afiseaza linie noua
    li $v0, 4
    la $a0, nl
    syscall

citire2:
    lw $a0, ($t0)
    li $v0, 1
    syscall

    li $v0, 4
    la $a0, space
    syscall

    add $t1, $t1, 1 # i++
    add $t0, $t0, 4 # incrementeaza adresa din sir
    blt $t1, $t2, citire2

    # exit

    li $v0, 10
    syscall
.end main