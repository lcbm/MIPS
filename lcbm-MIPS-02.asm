# CESAR School
# Computer Science
# Hardware Infrastructure
# Professor Paulo Serra Filho
# By Leonardo Castelo Branco de Melo
# Exercise 02: Palindrome

# MIPS Instruction Set   : github.com/MIPT-ILab/mipt-mips/wiki/MIPS-Instruction-Set
# MIPS Reference Material: sites.fas.harvard.edu/~libe295/spring2018/slides/MIPS%20Instruction%20Set.pdf
# MARS Syscall functions : courses.missouristate.edu/kenvollmar/mars/help/syscallhelp.html

.data   # declaring a static data segment (data is fixed in size)
    input:         .space   256               # reserve 256 bytes for user input
    isPalindrome:  .asciiz  "Is Palindrome!"
    notPalin:      .asciiz  "ERRROOOUUUU!"

.text   # instructions segment
    .globl main

main:
    la $a0, input  # read the string
    li $a1, 256
    li $v0, 8      # load "read_string" code into $v0.
    syscall

    la $t1, input
    la $t2, input

loop:
    lb    $t3, ($t2)      # load the byte at addr B into $t3.
    beqz  $t3,  end_loop  # if $t3 == 0, branch out of loop.
    addu  $t2, $t2, 1     # otherwise, increment B,
    b     loop            # and repeat the loop.

    end_loop:
        subu $t2, $t2, 2  # subtract 2 to move B back past the ’\0’ and ’\n’.

test:
    bge  $t1, $t2, isPalinMSG   # if A >= B, it’s a palindrome.

    lb   $t3, ($t1)             # load the byte at addr A into $t3,
    lb   $t4, ($t2)             # load the byte at addr B into $t4.
    bne  $t3, $t4, notPalinMSG  # if $t3  !=  $t4, not a palindrome.

    addu $t1, $t1, 1            # Otherwise, increment A,
    subu $t2, $t2, 1            # decrement B,
    b    test                   # and repeat the loop.

isPalinMSG:     # print isPalindrome variable, and  exit.
    la $a0, isPalindrome
    li $v0, 4
    syscall
    b  exit

notPalinMSG:    # print notPalin variable, and  exit.
    la $a0, notPalin
    li $v0, 4
    syscall
    b  exit

exit:   #  exit  the program:
    li $v0, 10  #  load "exit"  into $v0.
    syscall     #  make the  system call.

