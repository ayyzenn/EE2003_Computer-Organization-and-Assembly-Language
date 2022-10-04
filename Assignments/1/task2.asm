[org 0x0100]

jmp start
arr: dw 7 , 5 , 4 , 2
minval: dw 0
swapadress: dw 0
swapflag: db 0

start:
    mov cx , 3
    mov dx , 0
    outerloop:
        mov bx , arr
        add bx , dx
        mov ax , [bx]
        innerloop:
            add bx , 2
            cmp ax , [bx]
            jb noswap
                mov ax , [bx]
                mov [swapadress] , bx
                mov byte [swapflag] , 1
            noswap:
                cmp bx , arr + 6
                jnz innerloop
        cmp byte [swapflag] , 0
        jz cont
            mov bx , arr
            add bx , dx
            mov [minval] , ax
            mov ax , [bx]
            mov bx , [swapadress]
            mov [bx] , ax
            mov ax , [minval]
            mov bx , arr
            add bx , dx
            mov [bx] , ax
        cont:
        mov byte [swapflag] , 0
        add dx , 2
        dec cx
        cmp cx , 0
        jnz outerloop

mov ax , 0x4c00
int 0x21
