.section .data
a:
        .zero   40
b:
        .word   27
c:
        .word   1
.section .text
.global main
main:
bb1:
        sub     sp, sp, #16
        mov     x2, #0
        str     x2, [sp, #12]
        mov     x2, #0
        str     x2, [sp, #8]
        mov     x2, #200
        str     x2, [sp, #4]
        mov     x2, #0
        str     x2, [sp]
        b       bb2
bb2:
        ldr     x9, [sp, #12]
        cmp     x9, #10
        b.lt    bb3
        b       bb4
bb3:
        ldr     x9, [sp, #12]
        adr     x3, a
        add     x3, x3, #4
        mov     x10, x3
        str     x9, [x10]
        ldr     x9, [sp, #12]
        add     x10, x9, #1
        str     x10, [sp, #12]
        b       bb2
bb4:
        mov     x2, #0
        str     x2, [sp, #12]
        ldr     x9, [sp, #12]
        cmp     x9, #10
        b.lt    bb5
        b       bb6
bb5:
        ldr     x9, [sp, #8]
        adr     x3, a
        add     x3, x3, #0
        mov     x10, x3
        ldr     x11, [x10]
        add     x10, x9, x11
        str     x10, [sp, #8]
        ldr     x9, [sp, #12]
        mov     x3, #2
        mul     x10, x9, x3
        str     x10, [sp, #12]
        b       bb7
bb6:
        b       bb7
bb7:
        mov     x0, #0
        add     sp, sp, #16
        ret
