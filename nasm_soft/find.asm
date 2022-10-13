; Code to check the number is greater then 5 or less then 5 and 
; store the sum of all the numbers that are greater then or less then 5
[org 0x0100]

jmp start

num: dw 1,2,3,4,5,6,7,8,9,10

greater: dw 0
lesser: dw 0

start:
    mov ax , 0
    mov bx , num
    mov cx , 10

    mov dx , 5
    outerloop:
        mov ax , [bx]
        add bx , 2
        cmp ax , dx
        jna less

        add [greater] , ax
        dec cx
        jnz outerloop

        jmp end

        less:
            add [lesser] , ax
            dec cx
            jnz outerloop

end:
    mov  ax, 0x4c00
    int  0x21


        



        

    