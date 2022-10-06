[org 0x0100]

jmp Main

; Factorial ftns variables
result_fac: dw 0
k: dw 0

; Summation
n: dw 2                 ; used to iterate the loop
sum: dw 0

Factorial:    ; fac(k)
        
        push bp 
        mov bp , sp

        push ax
        push bx
        push cx
        
        mov ax , [bp + 4]        ; store the value of k
        mov bx , 2               ; (2k + 1)

        mul bx
        add ax , 1
        mov cx , ax

        cmp cx , 1
        je loop_1
                dec cx

        loop_1:
                mul cx
                dec cx
                jnz loop_1

        mov word[result_fac] , ax

        pop cx
        pop bx
        pop ax
        pop bp

        ret 2

Summation:

        push bp 
        mov bp , sp

        push ax 
        push bx
        push cx

        mov ax , [bp + 6]           ; k = 2
        mov cx , [bp + 4]           ; n = 1

        loop_2:
                push ax
                call Factorial

                mov bx , 2
                div bx

                cmp dx , 0
                jne odd
                        ; if even
                        push ax
                        push bx
                        mov ax , 1
                        mov bx , word[result_fac]
                        div bx
                        mov word[sum] , ax
                        pop bx
                        pop ax
                        jmp next
                odd:
                        push ax
                        push bx
                        mov ax , -1
                        mov bx , word[result_fac]
                        div bx
                        mov word[sum] , ax
                        pop bx
                        pop ax
                next:
                inc ax
                dec cx
                jnz loop_2

        mov ax , word[sum]

        pop cx
        pop bx
        pop ax
        pop bp

        ret 4
        
Main:

mov bx , [k]
mov cx , [n]

push bx
push cx

call Summation

mov ax , 0x4c00
int 0x21

