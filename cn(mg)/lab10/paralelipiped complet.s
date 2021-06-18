#calculeaza pentru un paralelipiped volumul, suprafata si raportul volum suprafata

.text
.globl main

main:
	#incarca variabilele in registrii
	lw $t0, laturaA
	lw $t1, laturaB
	lw $t2, laturaC

	#afla volumul
	mul $t3, $t0, $t1
	mul $t4, $t3, $t2
	move  $s0, $t4

	#afla suprafata
	mul $t3, $t0, $t1 #A*B
	mul $t4, $t0, $t2 #A*C
	mul $t5, $t1, $t2 #B*C
	add $t6, $t3, $t4
	add $t7, $t6, $t5
	mul $t7, $t7, 2
	move $s1, $t7

	#converteste intregii in float
	mtc1.d $s0, $f0
	cvt.s.w $f0, $f0

	#converteste intregii in float
	mtc1.d $s1, $f1
	cvt.s.w $f1, $f1

	#afiseaza primul mesaj
	li $v0, 4
	la $a0, m1
	syscall

	#afiseaza volumul
  	li $v0, 2
  	mov.s $f12, $f0   # Move contents of register $f3 to register $f12
 	syscall	

	#afiseaza linie noua
	li $v0, 4
	la $a0, nl
	syscall

	#afiseaza al doilea mesaj
	li $v0, 4
	la $a0, m2
	syscall

	#afiseaza suprafata
  	li $v0, 2
  	mov.s $f12, $f1   # Move contents of register $f3 to register $f12
 	syscall

	#afiseaza linie noua
	li $v0, 4
	la $a0, nl
	syscall

	#afiseaza al treilea mesaj
	li $v0, 4
	la $a0, m3
	syscall	
	
	#face raportul volum suprafata
	div.s $f2, $f0, $f1
	
	#afiseaza raportul
	li $v0, 2
	mov.s $f12, $f2
	syscall
	
	
	
	li $v0, 10
	syscall

.end main

.data

laturaA: .word 2
laturaB: .word 3
laturaC: .word 4

m1: .asciiz "volumul este: "
m2: .asciiz "suprafata este: "
m3: .asciiz "raportul volum suprafata este: "
nl: .asciiz "\n"
