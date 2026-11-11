# Listing 7 - lb and lbu
.data
b1: .byte 0xF0
 
.text
.globl main
main:
# Load scores[1] and scores[2] from memory into temporary registers
lw   $t0, 4($s0)          # $t0 = scores[1] (offset 1 * 4 = 4 bytes)
lw   $t1, 8($s0)          # $t1 = scores[2] (offset 2 * 4 = 8 bytes)

# Compute the sum
add  $t2, $t0, $t1        # $t2 = scores[1] + scores[2]

# Store the result back into scores[3] in memory
sw   $t2, 12($s0)         # scores[3] = $t2 (offset 3 * 4 = 12 bytes)
    syscall