[org 0x0100]

jmp start

rollno:     db   '20P-0051'   
length:      dw   8

clrscr:      ; clsr ftn 
    push es
    push ax
    push di

    mov  ax, 0xb800
    mov  es, ax
    mov  di, 0

    next1:
        mov  word [es:di], 0x0720
        add  di, 2
        cmp  di, 4000
        jne  next1

    pop  di 
    pop  ax
    pop  es
    ret


print_roll:
    push bp
    mov  bp, sp
    push es
    push ax
    push cx 
    push si 
    push di 

    mov ax, 0xb800 
    mov es, ax 
    mov di, 1830      ; intializing with the di with 1830 to get the middle row         

    mov si, [bp + 6]
    mov cx, [bp + 4]
    mov ah, 0x07

    next2: 
        mov al, [si]
        mov [es:di], ax 
        add di, 2 
        add si, 1 
 
        loop next2 

    pop di 
    pop si 
    pop cx  
    pop ax 
    pop es 
    pop bp 
    ret 4 

start: 
    call clrscr 

    mov ax, rollno 
    push ax 
    push word [length]
    call print_roll 

    mov ah, 0x1
    int 0x21 

    mov ax, 0x4c00 
    int 0x21 
