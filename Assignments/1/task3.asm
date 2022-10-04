[org 0x0100]

jmp start

array1: dw 1,3,9,2,4,8,7,1,6,5
f_half: dw 0
s_half: dw 0

greater_half: dw 0

array2: dw 11,8,4,9,3,5,8
min: dw 0

result: dw 0

start:
    mov cx , 5    ; counter
    mov bx , array1
    mov ax , 0
    loop1:
        add ax , [bx]
        add  bx, 2
        dec cx
        jnz loop1

    mov [f_half] , ax

    mov cx , 5    ; counter
    mov bx , array1 + 10
    mov ax , 0
    loop2:
        add ax , [bx]
        add  bx, 2
        dec cx
        jnz loop2

    mov [s_half] , ax

    ;;;;;;;;;;next work;;;;;;;;;;

    mov bx , array2
    mov cx , 7 
    mov ax , 0

    mov dx , [array2]

    loop3:
        cmp dx , [bx]
        ja update

    continue:
        add bx , 2
        dec cx
        jz next
        jmp loop3

    update:
    mov dx , [bx]
    mov [min] , dx
    jmp continue

next:
    mov ax , [f_half]
    mov bx , [s_half]
    cmp ax , bx
    jc yes

    mov [greater_half] , ax
    jmp next2


    yes:
        mov [greater_half] , bx

next2:
    mov ax , [greater_half]
    mov dl , [min]

    div dl

    mov [result] , ax

    mov ax ,0x4c00
    int 0x21









