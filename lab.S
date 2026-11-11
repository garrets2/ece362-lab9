######################################################
# Lab 9 template file
######################################################

######################################################
# .data is where variables will reside.
# We define the following below so you know what 
# their values are.
.data
.global lowercase_string
lowercase_string:
    // Specify a string ending with '\0'
    .asciz "ece 362 is awesome!"

// Align to 4bytes boundary as we have a string above
.balign 4
######################################################


######################################################
# All code goes in the .text section
.text

.global asm_strlen
asm_strlen:
    /* uint32_t asm_strlen(char *str)
     * Take in a pointer to a string and return
     * its length up to the null terminating
     * character `\0`
    **/   

    /* Enter your code after this comment */

    beq x10, x0, asm_strlen_end
    li x11, 0

    asm_strlen_loop:
        lb x12, 0(x10)
        beq x12, x0, asm_strlen_done
        addi x10, x10, 1
        addi x11, x11, 1
        jal x0, asm_strlen_loop

    asm_strlen_done:
        mv x10, x11

    asm_strlen_end:
        ret
    
    /* Enter your code above this comment */
    ret

.global asm_fib
asm_fib:
    /* void asm_fib(int *arr, uint32_t length)
     * Accept a pointer to an array of integer and
     * the length of the array, then generate fibonacci
     * series starting at `0` and store the result
     * back to the array `arr` at corresponding indices.
     **/

    /* Enter your code after this comment */
    
    beq x10, x0, asm_fib_done
    beq x11, x0, asm_fib_done
    li x12, 0
    li x13, 1
    li x14, 0
    li x17, 4

    asm_fib_loop:
        bge x14, x11, asm_fib_done
        mul x15, x14, x17
        add x16, x10, x15
        bne x14, x0, asm_fib_check_1
        sw x12, 0(x16)
        jal x0, asm_fib_increment

    asm_fib_check_1:
        li x18, 1
        bne x14, x18, asm_fib_else_gen
        sw x13, 0(x16)
        jal x0, asm_fib_increment

    asm_fib_else_gen:
        mv x18, x13
        add x13, x13, x12
        mv x12, x18
        sw x13, 0(x16)

    asm_fib_increment:
        addi x14, x14, 1
        jal x0, asm_fib_loop

    asm_fib_done:
        ret

    /* Enter your code above this comment */
    ret

.global asm_toUppercase
asm_toUppercase:
    /* void asm_toUppercase(char *str)
     * loop through an entire string and only convert
     * the lowercase letter to uppercase, leaving the
     * rest of the string intact
     **/

    /* Enter your code after this comment */
    
    beq x10, x0, asm_toUppercase_end
    li x12, 97
    li x13, 122

    asm_toUppercase_loop:
        lb x11, 0(x10)
        beq x11, x0, asm_toUppercase_end
        blt x11, x12, asm_toUppercase_increment
        blt x13, x11, asm_toUppercase_increment
        addi x14, x11, -32
        sb x14, 0(x10)

    asm_toUppercase_increment:
        addi x10, x10, 1
        jal x0, asm_toUppercase_loop

    asm_toUppercase_end:
        ret

    /* Enter your code above this comment */
    ret


######################################################
