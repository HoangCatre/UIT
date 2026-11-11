.data
board:  .word 0, 0, 0, 0, 0, 0, 0, 0, 0

.text
.globl main
main:
    la   $s0, board         # Base address of board

    # --- Part 1: Store 1 into cell (r=1, c=2) ---
    li   $s1, 1             # r = 1
    li   $s2, 2             # c = 2
    
    # Compute 3 * r using shift/add: 3 * r = r + 2 * r
    sll  $t0, $s1, 1        # $t0 = 2 * r
    add  $t0, $t0, $s1      # $t0 = 3 * r
    add  $t0, $t0, $s2      # $t0 = (3 * r) + c (word index)
    sll  $t0, $t0, 2        # byte offset = word index * 4
    add  $t1, $s0, $t0      # $t1 = address of board[1][2]
    
    li   $t2, 1             # mark X = 1
    sw   $t2, 0($t1)        # store 1 into cell (1, 2)

    # --- Part 2: Store 2 into cell (r=2, c=0) ---
    li   $s1, 2             # r = 2
    li   $s2, 0             # c = 0
    
    # Compute 3 * r using shift/add: 3 * r = r + 2 * r
    sll  $t0, $s1, 1        # $t0 = 2 * r
    add  $t0, $t0, $s1      # $t0 = 3 * r
    add  $t0, $t0, $s2      # $t0 = (3 * r) + c (word index)
    sll  $t0, $t0, 2        # byte offset = word index * 4
    add  $t1, $s0, $t0      # $t1 = address of board[2][0]
    
    li   $t2, 2             # mark O = 2
    sw   $t2, 0($t1)        # store 2 into cell (2, 0)

    li   $v0, 10            # exit program
    syscall