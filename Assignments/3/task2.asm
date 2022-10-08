[org 0x0100]

jmp main

num: dw 20, 15

GCD:
    push bp 
    mov bp , sp

    push ax 
    push bx 

    mov ax , [bp + 6]           ; x
    mov bx , [bp + 4]           ; y

    cmp bx , 0                  ; if (y == 0)   => return x
    jz if_1

    cmp ax , bx 
    jc esle_if

    sub ax , bx
    push ax 
    push bx 
    call GCD
    jmp end

    if_1:
        mov dx , ax             ; using as "dx" as a returning register
        jmp end

    esle_if:
        push bx
        push ax

        call GCD
        jmp end

    end:
        pop bx
        pop ax
        pop bp

    ret 4


main:

mov ax , [num]
mov bx , [num + 2]

push ax
push bx

call GCD

mov ax , 0x4c00
int 0x21