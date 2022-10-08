[org 0x0100]

jmp main

;for 4x4 matrix
array1: dw 3,8,12,3 , 8,15,3,2 , 2,11,7,3 , 10,5,9,6    
primary_sum_4x4: dw 0
secondary_sum_4x4: dw 0
t_sum_4x4: dw 0

;for 3x3 matrix
array2: dw 1,2,3 , 4,5,6 , 7,8,9
primary_sum_3x3: dw 0
secondary_sum_3x3: dw 0
t_sum_3x3: dw 0

matrix_4x4:
        mov si , 0
        l1_4x4:                                 ;calculating primary sum
            mov ax , [bx + si]
            add word[primary_sum_4x4] , ax
            add si , 10
            loop l1_4x4

        mov si , 6
        mov cx , 4
        l2_4x4:                                 ;calculating secondary sum
            mov ax , [bx + si]
            add word[secondary_sum_4x4] , ax
            add si , 6
            loop l2_4x4
        
        mov ax , [primary_sum_4x4]
        add ax , [secondary_sum_4x4]            ;find the total sum
        mov  word[t_sum_4x4] , ax
        ret

matrix_3x3:
        mov si , 0
        l1_3x3:                                 ;calculating primary sum
            mov ax , [bx + si]
            add word[primary_sum_3x3] , ax
            add si , 8
            loop l1_3x3

        mov si , 4
        mov cx , 3
        l2_3x3:                                 ;calculating secondary sum
            mov ax , [bx + si]
            add word[secondary_sum_3x3] , ax
            add si , 4
            loop l2_3x3
        
        mov ax , [primary_sum_3x3]
        add ax , [secondary_sum_3x3]            ;find the total sum
        mov  word[t_sum_3x3] , ax
        ret

main:

;;;;;;;;;;;;;;;;;;;;
mov bx , array1    ;
mov cx , 4         ;
call matrix_4x4    ;
;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;
mov bx , array2    ;
mov cx , 3         ;
call matrix_3x3    ;
;;;;;;;;;;;;;;;;;;;;

mov ax , 0x4c00
int 0x21