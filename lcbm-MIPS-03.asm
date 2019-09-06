# CESAR School
# Computer Science
# Hardware Infrastructure
# Professor Paulo Serra Filho
# By Leonardo Castelo Branco de Melo
# Exercise 03: String Reverse

# MIPS Instruction Set   : github.com/MIPT-ILab/mipt-mips/wiki/MIPS-Instruction-Set
# MIPS Reference Material: sites.fas.harvard.edu/~libe295/spring2018/slides/MIPS%20Instruction%20Set.pdf
# MARS Syscall functions : courses.missouristate.edu/kenvollmar/mars/help/syscallhelp.html

.data
    input:  .space  256  # reserve 256 bytes for user input
    output: .space  256  # reserve 256 bytes for user input

.text
    .globl main

main:
    li  $v0, 8           # 8 = read string service
    la  $a0, input       # a0 = address of input buffer
    li  $a1, 256         # a1 = maximum number of characters to read
    syscall

    jal strlen           # use 'jal' to save $ra (return address)

    add $t1, $zero, $v0  # copy some of our parameters
    add $t2, $zero, $a0  # save our input string
    add $a0, $zero, $v0

reverse:
    li $t0, 0  # reset $t0
    li $t3, 0  # reset $t3

    reverse_loop:
        add  $t3, $t2, $t0     # $t2 is the base address for array
        lb   $t4, 0($t3)       # load a byte
        beqz $t4, exit         # null byte
        sb   $t4, output($t1)  # Overwrite this byte address in memory
        subi $t1, $t1, 1       # Subtract our overall string length by 1 (j--)
        addi $t0, $t0, 1       # Advance our counter (i++)
        j    reverse_loop      # Loop until we reach our condition

strlen:
    li $t0, 0
    li $t2, 0

    strlen_loop:
        add   $t2, $a0, $t0     # a0 is our input string
        lb    $t1, 0($t2)
        beqz  $t1, strlen_exit
        addiu $t0, $t0, 1
        j     strlen_loop

    strlen_exit:
        subi $t0, $t0, 1        # null byte is stored by default for input strings requested through
                                # the syscall subtract one from the end result will return length.
        add  $v0, $zero, $t0    # v0 returns the length
        add  $t0, $zero, $zero
        jr   $ra

exit:
    li $v0, 4       # 4 = print string service
    la $a0, output  # a0 = address of null-terminated string to print
    syscall

    li $v0, 10      # 10 = exit (terminate execution)
    syscall
