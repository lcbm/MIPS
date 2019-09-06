# CESAR School
# Computer Science
# Hardware Infrastructure
# Professor Paulo Serra Filho
# By Leonardo Castelo Branco de Melo
# Exercise 04: Array Summation

# MIPS Instruction Set   : github.com/MIPT-ILab/mipt-mips/wiki/MIPS-Instruction-Set
# MIPS Reference Material: sites.fas.harvard.edu/~libe295/spring2018/slides/MIPS%20Instruction%20Set.pdf
# MARS Syscall functions : courses.missouristate.edu/kenvollmar/mars/help/syscallhelp.html

.data   # declaring a static data segment (data is fixed in size)
    array:     .word 10,9,8,7,6,5,4,3,2,1
    arraySize: .word 10

.text   # instructions segment
    la     $s0, array
    lw     $s7, arraySize
    li     $s6, 0
    .globl main

main:
    move $s1, $zero      # set counter for # of elems summed
    move $s2, $zero      # set offset from array

sum:
    bge  $s1, $s7, exit

    lw   $a0, array($s2) # print next value from the list
    add  $s6, $s6, $a0   # Compute the sum

    addi $s1, $s1, 1     # increment the loop counter
    addi $s2, $s2, 4     # step to the next array elem
    j    sum

exit:   #  exit  the program:
    li   $v0, 1     # print sum of aray
    move $a0, $s6
    syscall         #  make the  system call.
