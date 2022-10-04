[org 0x0100]

jmp start

num: dw 53
result: dw 0

start:
    mov cx , 8
    mov bx , [num]
    again:
        shr bx , 1
        rcl byte [result] , 1
        dec cx 
        jnz again

    mov ax , [result]

mov ax , 0x4c00
int 0x21
