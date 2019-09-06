# CESAR School
# Computer Science
# Hardware Infrastructure
# Professor Paulo Serra Filho
# By Leonardo Castelo Branco de Melo
# Exercise 01: Bubble Sort

# MIPS Instruction Set   : github.com/MIPT-ILab/mipt-mips/wiki/MIPS-Instruction-Set
# MIPS Reference Material: sites.fas.harvard.edu/~libe295/spring2018/slides/MIPS%20Instruction%20Set.pdf
# MARS Syscall functions : courses.missouristate.edu/kenvollmar/mars/help/syscallhelp.html

.data    # declaring a static data segment (data is fixed in size)
    array:     .word 5,4,3,2,1,0,-1,-2,-3,-4  # type arrayName = {5,4,3,2,1,0,-1,-2,-3,-4};
    arraySize: .word 10                       # type arraySize = 9;

.text   # instructions segment
    la      $s7, array       # start of array | load Address of 'array' base address into '$t0'.
    lw      $s6, arraySize   # array size     | load Word to get the value of  'arraySize'.
    .globl  main

main:
    li  $s0, 0      # initialize counter 1 for bubbleSort 1
    li  $s1, 0      # initialize counter 2 for bubbleSort 2

    jal bubbleSort  # jump and link...
    jal print       # jump and link...
    j   exit        # jump to...

bubbleSort:
    sll $t7, $s1, 2             # multiply $s1 by 2 and put it in t7
    add $t7, $s7, $t7           # add the address of array to t7

    lw $t0, 0($t7)              # load array[j]
    lw $t1, 4($t7)              # load array[j+1]

    slt $t2, $t0, $t1           # if t0 < t1
    bne $t2, $zero, increment

    sw $t1, 0($t7)              # swap
    sw $t0, 4($t7)

increment:
    addi $s1, $s1, 1            # increment t1
    sub  $s5, $s6, $s0          # subtract s0 from s6
    bne  $s1, $s5, bubbleSort   # if s1 (counter for second bubbleSort) does not equal 9, bubbleSort

    addi $s0, $s0, 1            # otherwise add 1 to s0
    li   $s1, 0                 # reset s1 to 0
    bne  $s0, $s6, bubbleSort   # go back through bubbleSort with s1 = s1 + 1

print:
    beqz $s6, exit      # if t3 = t4 go to exit

    lw $t5, 0($s7)      # load from array
    li $v0, 1           # print the number
    move $a0, $t5
    syscall

    li $a0, 0x20        # print space, 0x20 is hex code for space
    li $v0, 11          # syscall number for printing character
    syscall

    addi $s7, $s7, 4    # increment through the array
    sub $s6, $s6, 1     # decrement arraySize

    j print

exit:   # exit  the program:
    li $v0, 10  # load "exit" into $v0.
    syscall     # make the system call.
