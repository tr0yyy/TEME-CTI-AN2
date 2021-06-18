.data
	matrice : .word 1, 2, 3, 4
		.word 5, 6, 7, 8
		.word 9, 10, 11, 12
		.word 13, 14, 15, 16

	dimMatrice: .word 4
	sumaRAM: .word 0

.text
.globl main

main:
	la $a0, matrice
	lw $a1, dimMatrice
	mul $a2, $a1,4

	jal sumaMatrice

	sw $t0, sumaRAM
	move $a0, $t0
	li $v0, 1
	syscall

	li $v0, 10
	syscall
.end main

.globl sumaMatrice

sumaMatrice:
	li $t0, 0
	li $t1, 0
	li $t2, 0

	bucla:
		mul $t3, $t1, $a2
		mul $t4, $t2, 4
		add $t5, $t4, $t3
		
		add $t3, $a0, $t5
		lw $t6, ($t3)
		add $t0, $t0,$t6

		
        add $t2, $t2, 1
		blt $t2, $a1, bucla
		add $t1, $t1, 1
		li $t2, 0
	
	blt $t1, $a1, bucla

jr $ra
.end sumaMatrice