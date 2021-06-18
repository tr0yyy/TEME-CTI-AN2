# Example program to calculate the surface area
# and volume of a sphere given the radius.
# ­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­

# ­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­
# text/code section
.text
.globl     main
main:

# ­­­­­
# Compute: (4.0 * pi) which is used for both equations.
l.s      $f2, fourPtZero
l.s      $f4, pi
mul.s    $f4, $f2, $f4    # 4.0 * pi

	li $v0, 4
	la $a0, fourpi
	syscall
li       $v0, 2
mov.s    $f12, $f4
syscall

	#afiseaza linie noua
	li $v0, 4
	la $a0, nl
	syscall

# mov.s    $f6, $f0 
l.s      $f6, radius      # radius

# ­­­­­
# Calculate surface area of a sphere.
# surfaceArea = 4.0 * pi * radius^2
mul.s    $f8, $f6, $f6    # radius^2
mul.s    $f8, $f4, $f8    # 4.0 * pi * radius^2
s.s      $f8, surfaceArea  # store final answer

	#afiseaza suprafata
	li $v0, 4
	la $a0, area
	syscall
  	li $v0, 2
  	mov.s $f12, $f8   # Move contents of register $f8 to register $f12
 	syscall


	#afiseaza linie noua
	li $v0, 4
	la $a0, nl
	syscall


# ­­­­­
# Calculate volume of a sphere.
#   volume = (4.0 * pi / 3.0) * radius^3
l.s      $f8, threePtZero


div.s    $f5, $f4, $f8     # (4.0 * pi / 3.0)
mul.s    $f10, $f6, $f6
mul.s    $f10, $f10, $f6   # radius^3
mul.s    $f11, $f5, $f10   # 4.0*pi/3.0*radius^3
s.s      $f11, volume # store final answer


	#afiseaza volumul
	li $v0, 4
	la $a0, vol
	syscall  	
	li $v0, 2
  	mov.s $f12, $f11  # Move contents of register $f5 to register $f12
 	syscall	


# ­­­­­
# Done, terminate program.
li       $v0, 10           # terminate call code
syscall                    # system call

.end main

# Data Declarations
.data
pi:          .float   3.14159
fourPtZero:  .float   4.0
threePtZero: .float   3.0
radius:      .float  17.25
surfaceArea: .float   0.0
volume:      .float   0.0
nl:          .asciiz  "\n"
fourpi:		 .asciiz  "4*pi="
area:        .asciiz  "Aria="
vol:         .asciiz  "Vol="