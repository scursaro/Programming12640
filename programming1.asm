#Sebastian Cursaro
#CS 2640
#Due Date: April 2, 2023
#Objectives:
	#Task 1: User Input and Output
		#Use "main: " label for this task
		#Get 2 int values from the user
		#The two user values should be held in registers $s0 and $s1, respectively
		#Output the user inputs in the "Run I/O" section in MARS environment back to the user
	#Task 2: Arithmetic Operation Practice
		#add two values (use instruction "add")
		#subtract two values (use instruction "sub")
		#multiply two values (use instruction "mul")
		#divide two values (use instruction "div")
		#Output the arithmetic results in the "Run I/O" section in MARS environment back to the user
	#Task 3: Conditions
		#If the two user inputs from Task 1 are equal to each other, output "User inputs are the same"
		#If the two user inputs from Task 1 are not equal to each other, output "User inputs are different
		
.data
	#Here are the strings needed for task one
	getInput: .asciiz "Please enter integer one: "
	getInput2: .asciiz"Please enter integer two: "
	displayOutput: .asciiz "\nThe two inputs are: "
	space: .asciiz " and "
	
	
	#Here are the strings needed for Task2
	tasktwo: .asciiz "\nBelow we will perfrom arithmatic instructions: +, -, / and *\n"
	addR: .asciiz "\n---------------\nAddition: \nThe result for addition is: "
	subR: .asciiz "\n---------------\nSubtraction:\nThe result for subtraction is: "
	divR: .asciiz "\n---------------\nDivision:\nThe result for Division is: "
	multR: .asciiz "\n---------------\nMultiplication:\nThe result for Multiplication is: "
	
	#Task 3 Strings
	equalMsg: .asciiz "\n\nThe two inputted numbers are the same"
	notEqualMsg: .asciiz "\n\nThe two inputted numbers are not the same"
	
.text
main:
	#we will now print out the string to prompt the user to enter an integer
	li $v0, 4
	la $a0, getInput
	syscall
	
	#we will now process the entered integer
	li $v0, 5
	syscall
	move $s0, $v0 #and store that integer into register $s0
	
	#we will repeat this process for the second integer
	li $v0, 4
	la $a0, getInput2
	syscall
	
	li $v0, 5
	syscall
	move $s1, $v0 #however we are storing int2 into register $s1
	
	#we will now print out both integers
	li $v0, 4
	la $a0, displayOutput
	syscall
	
	li $v0, 1
	move $a0, $s0 #int 1 printed
	syscall
	
	li $v0, 4
	la $a0, space #this prints out the word "and" for the integers
	syscall
	
	li $v0, 1
	move $a0, $s1 #int 2 printed
	syscall
	
	#We will now perform Task 2
	
	li $v0, 4
	la $a0, tasktwo
	syscall
	
	#addition
	li $v0, 4
	la $a0, addR
	syscall
	
	#adding two ints, and storing result in $t1, then printing it
	add $t1, $s0, $s1
	li $v0, 1
	move $a0, $t1
	syscall
	
	#subtraction
	li $v0, 4
	la $a0, subR
	syscall
	
	sub $t2, $s0, $s1
	li $v0, 1
	move $a0, $t2
	syscall
	
	#division
	li $v0, 4
	la $a0, divR
	syscall
	
	div $t1, $s0, $s1
	li $v0, 1
	move $a0, $t1 #overides #t1, and stores result there (testing out register stuff)
	syscall
	
	#multiplicaiton
	li $v0, 4
	la $a0, multR
	syscall
	
	mul $t1, $s0, $s1
	li $v0, 1
	move $a0, $t1
	syscall
	
	#Below is Task 3
	
	beq $s0, $s1, equal #these go to the Labels/functions below
	bne $s0, $s1, notEqual

equal:
	li $v0, 4
	la $a0, equalMsg #prints if the numbers are equal
	syscall
	j exit
notEqual:
	li $v0, 4
	la $a0, notEqualMsg #prints that they are not equal
	syscall
exit:
	li $v0, 10
	syscall