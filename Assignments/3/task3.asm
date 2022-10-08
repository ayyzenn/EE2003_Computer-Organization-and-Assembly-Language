[org 0x0100]
jmp main 

num: dw 7

array: dw 0 , 1 ;, 0 , 0 , 0 ,0 , 0 ,0 , 0 ,0 , 0 ,0 , 0 ,0 , 0 ,0 , 0 ,0 , 0 ,0 , 0 


fibonacci:
        push bp
        mov bp , sp

        push bx
        push si

        mov bx , [bp + 4]
    
        mov si , 4

        add bx , si

        add ax , dx

        mov bx , ax 

        ; dec cx
        ; cmp cx , 0
        ; jz end

        ; push ax 
        ; push bx

        ; call fibonacci

        end:
            pop si
            pop dx
            pop bx
            pop ax
            pop bp

        ret 4




main:

mov ax , [array]              ; a
mov dx , [array + 2]          ; b
mov cx , [num]              ;check its condition

push word array

call fibonacci

mov ax , 0x4c00
int 0x21

