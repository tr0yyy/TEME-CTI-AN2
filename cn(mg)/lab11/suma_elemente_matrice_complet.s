# Suma elementelor de pe diagonala

.data
    matrice: .word 1, 2, 3, 4
            .word 5, 6, 7, 8
            .word 9, 10, 11, 12
            .word 13, 14, 15, 16
    
    dimensiuneArray: .word 4
    suma: .word 0

    lungimeWord = 4 # Valoare constanta - un word are 4 octeti

.text
.globl main

main:
    la $a0, matrice # Incarca adresa de inceput a matricii
    lw $a1, dimensiuneArray # Stocheaza dimensiunea matricii

    # Cheama functia
    jal sumaDiagonala

    # Afiseaza rezultatul
    move $a0, $t0
    li $v0, 1
    syscall

    # Exit
    li $v0, 10
    syscall
.end main

.globl sumaDiagonala

sumaDiagonala:
    # Valori initiale pentru suma si indice bucla
    li $t0, 0
    li $t1, 0

    bucla: # Pentru calcularea sumei
        mul $t2, $t1, $a1 # Indice rand * dimensiune rand
        add $t2, $t2, $t1 # + Indice coloana

        mul $t2, $t2, lungimeWord # Multiplica valoarea obtinuta anterior cu dimensiunea 
        add $t3, $a0, $t2 # Aduna valoarea la adresa de inceput

        lw $t4, ($t3) # Incarca valoarea din sir indicata de adresa nou obtinuta

        add $t0, $t0, $t4 # Aduna elementul la valoarea curenta a sumei

        add $t1, $t1, 1 # Incrementeaza indice
        blt $t1, $a1, bucla # Continua bucla

    jr $ra
.end sumaDiagonala
