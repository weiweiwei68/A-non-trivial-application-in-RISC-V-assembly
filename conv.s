.data

# Data for matrix
    len: .word 9
    image_matrix1: .word 0, 3, 9, 6, 4, 7, 8, 1, 2
    image_matrix2: .word 7, 8, 5, 1, 3, 6, 6, 3, 0
    image_matrix3: .word 8, 5, 6, 9, 1, 0, 5, 2, 4
    image_matrix4: .word 9, 5, 1, 6, 4, 0, 7, 1, 9
    image_matrix5: .word 5, 7, 3, 2, 1, 6, 1, 0, 1
    image_matrix6: .word 7, 5, 8, 4, 0, 3, 5, 2, 1
    image_matrix7: .word 5, 1, 8, 6, 4, 6, 8, 5, 9
    image_matrix8: .word 0, 1, 5, 7, 4, 3, 4, 8, 9
    image_matrix9: .word 1, 0, 5, 2, 3, 6, 9, 1, 7
    kernel_matrix1: .word -1, -1, -1
    kernel_matrix2: .word -1, 8, -1
    kernel_matrix3: .word -1, -1, -1
    space: .string " "
    newline: .string "\n"
    test: .string "test"
.text
main:
    lw s0 len
    addi s0 s0 -3
    la s1 image_matrix1
    la s2 kernel_matrix1
    la s3 image_matrix2
    la s4 kernel_matrix2
    la s5 image_matrix3
    la s6 kernel_matrix3
    li s7 0
    jal ra conv
    la s1 image_matrix2
    la s2 kernel_matrix1
    la s3 image_matrix3
    la s4 kernel_matrix2
    la s5 image_matrix4
    la s6 kernel_matrix3
    li s7 0
    jal ra conv
    la s1 image_matrix3
    la s2 kernel_matrix1
    la s3 image_matrix4
    la s4 kernel_matrix2
    la s5 image_matrix5
    la s6 kernel_matrix3
    li s7 0
    jal ra conv
    la s1 image_matrix4
    la s2 kernel_matrix1
    la s3 image_matrix5
    la s4 kernel_matrix2
    la s5 image_matrix6
    la s6 kernel_matrix3
    li s7 0
    jal ra conv
    la s1 image_matrix5
    la s2 kernel_matrix1
    la s3 image_matrix6
    la s4 kernel_matrix2
    la s5 image_matrix7
    la s6 kernel_matrix3
    li s7 0
    jal ra conv
    la s1 image_matrix6
    la s2 kernel_matrix1
    la s3 image_matrix7
    la s4 kernel_matrix2
    la s5 image_matrix8
    la s6 kernel_matrix3
    li s7 0
    jal ra conv
    la s1 image_matrix7
    la s2 kernel_matrix1
    la s3 image_matrix8
    la s4 kernel_matrix2
    la s5 image_matrix9
    la s6 kernel_matrix3
    li s7 0
    jal ra conv
    j exit
conv:
    addi sp sp -8
    sw ra 0(sp)
loop:
    lw a0, 0(s1)
    lw a1, 0(s2)
    mul t0 a0 a1
    lw a0, 4(s1)
    lw a1, 4(s2)
    mul t1 a0 a1
    lw a0, 8(s1)
    lw a1, 8(s2)
    mul t2 a0 a1
    add t0 t0 t1
    add t3 t0 t2
    
    lw a0, 0(s3)
    lw a1, 0(s4)
    mul t0 a0 a1
    lw a0, 4(s3)
    lw a1, 4(s4)
    mul t1 a0 a1
    lw a0, 8(s3)
    lw a1, 8(s4)
    mul t2 a0 a1
    add t0 t0 t1
    add t0 t0 t2
    add t3 t3 t0
    
    lw a0, 0(s5)
    lw a1, 0(s6)
    mul t0 a0 a1
    lw a0, 4(s5)
    lw a1, 4(s6)
    mul t1 a0 a1
    lw a0, 8(s5)
    lw a1, 8(s6)
    mul t2 a0 a1
    add t0 t0 t1
    add t0 t0 t2
    add t3 t3 t0
    mv a1 t3
    
    jal ra print_pixel
    jal ra print_space
    addi s1 s1 4
    addi s3 s3 4
    addi s5 s5 4
    addi s7 s7 1
    bge s0 s7 loop
    jal ra print_newline
    lw ra 0(sp)
    addi sp sp 8
    jr ra
    
exit:
    li a7 10
    ecall
print_pixel:
    mv a0, a1
    li a7 1
    ecall
    jr ra
print_newline:
    la a0 newline
    li a7 4
    ecall
    jr ra
print_space:
    la a0 space
    li a7 4
    ecall
    jr ra
