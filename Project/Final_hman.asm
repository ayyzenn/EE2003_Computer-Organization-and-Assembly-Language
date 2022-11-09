[org 0x0100]

jmp start
;;;;;;;;;;;;;;;;;;;;;;;;;ALGORITHM;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;HANGMAN GAME;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;THIS GAME CONSIST OF DIFFERENT FUNCTIONS;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;clrscr:ITS WILL CLEAR SCREEN AND WE USED TO SET ORANGE COLOR TO FIRST SCREEN;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;printstr:USE TO PRINT STRING TO ON SCREEN CHARECTER BY CHARECTER;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;printstr12:PRINT SRING ON SCREEN WITH BLUE BACKGROUND;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;clrscr2:CLEAR SCREEN 2 WITH BLUE BACKGROUND;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;RANDSTART:GENEREATE RANDOM NUMBER FOR SELECTION OF ONE STRING TO GUESS;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;PRINTSCREEN2:THIS IS ONE OF MOST IMP FUNCTION IT CHECKS WHERE ALPHABET IS PRESENT AND PRINT IT IN RIGHT POSITION;;;;;;





;;;;;;;;;;;;;;;;;;;;;;;;;LOCAL VARIABLES;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                                                                                      ;;
message:      db  'HANGMAN GAME'                                                                      ;;
length:       dw   12                                                                                 ;;
line2:        db  'THE GAME THAT GIVE YOU LESSON:BY SAYING WRONG THINGS YOU COULD END SOMEONES LIFE'  ;;
length2:      dw   80 
                                                                                ;;
one:          db  'friends'                                                                           ;;
one1:         dw   7                                                                                  ;;
w1:           db  'word consist of 7 characters'                                                      ;; 
w11:          dw   28                                                                                 ;;
hint1:        db  'love'                                                                              ;;
h1:           dw   4
                                                                                  ;;
two:          db  'adventure'                                                                         ;;
two1:         dw    9                                                                                 ;; 
w2:           db  'word consist of 9 characters'                                                      ;; 
w12:          dw    28                                                                                ;; 
hint2:        db  'fun'                                                                               ;;  
h2:           dw   3   
                                                                               ;;
three:        db  'alphabets'                                                                         ;;
three1:       dw   9                                                                                  ;; 
w3:           db  'word consist of 9 characters'                                                      ;;
w13:          dw    28                                                                                ;;
hint3:        db  'AtoZ'                                                                              ;;
h3:           dw    4     
                                                                            ;;
h:            db  'hint:'                                                                             ;;
l:            dw    5                                                                                 ;;
comment:      db   'you have 7 turns to guess'                                                        ;; 
c:            dw    25                                                                                ;;
character:    db   'enter character'                                                                  ;; 
char:         dw     15                                                                               ;;
found:        db    'lifelines left'                                                                  ;;
f1:           dw     14                                                                               ;;
dash:         db    '___   '                                                                          ;;
dash1:        dw     6                                                                                ;; 
over:         db    'ohho! try again later'                                                           ;;
ov:           dw     21                                                                               ;;
done:         db    '!!congratulations you guessed right!!'                                           ;;
ddd           dw      37                                                                              ;;
dash2         db    ' | '                                                                             ;;
dd2           dw   3                                                                                  ;;  
dash3         db   ' \ '                                                                              ;;
dd3           dw    3                                                                                 ;;
dash4         db   ' / '                                                                              ;;
dd4           dw    3                                                                                 ;; 
f11           db ' 0 '                                                                                ;;   
f12           dw  3                                                                                   ;;
space         db  '    '                                                                              ;; 
sp1           dw 4                                                                                    ;;
names         db 'by Saad AND Rimsha'                                                           ;;
n1            dw  18                                                                                  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



clrscr:     ;.....backgound of first screen  .................;;
    push es                                                   ;;
    push ax                                                   ;;
    push di                                                   ;;      
                                                              ;;
    mov  ax, 0xb800                                           ;;      
    mov  es, ax                                               ;;
    mov  di, 0                                                ;;       
                                                              ;;       
                                                              ;;                      
nextloc:                                                      ;;       
    mov  word [es:di], 0x6320                                 ;;        
    add  di, 2                                                ;;
    cmp  di, 4000                                             ;;
    jne  nextloc                                              ;;
                                                              ;;
    pop  di                                                   ;;
    pop  ax                                                   ;;
    pop  es                                                   ;;
    ret    ;..................................................;;
   
; this is used to display text on the screen   
printstr:;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    push bp                                                    ;;
    mov  bp, sp                                                ;;
    push es                                                    ;;
    push ax                                                    ;;
    push cx                                                    ;;
    push si                                                    ;;
    push di                                                    ;;
                                                               ;;
    mov ax, 0xb800                                             ;;
    mov es, ax                                                 ;;
    mov di,bx                                                  ;;
    mov si, [bp + 6]                                           ;;
    mov cx, [bp + 4]                                           ;;
    mov ah, 0x20 ; only need to do this    once                ;;
                                                               ;;
nextchar:                                                      ;;
    mov al, [si]                                               ;;
    mov [es:di], ax                                            ;;
    add di, 2                                                  ;;
    add si, 1                                                  ;;
    loop nextchar                                              ;;
                                                               ;;
                                                               ;;
    pop di                                                     ;;
    pop si                                                     ;;
    pop cx                                                     ;;
    pop ax                                                     ;;
    pop es                                                     ;; 
    pop bp                                                     ;; 
   ret 4;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


; this is used to create our character
printstr12:;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    push bp                                                    ;;
    mov  bp, sp                                                ;;
    push es                                                    ;;
    push ax                                                    ;;
    push cx                                                    ;;
    push si                                                    ;;
    push di                                                    ;;
                                                               ;;
    mov ax, 0xb800                                             ;;
    mov es, ax                                                 ;;
    mov di,bx                                                  ;;
    mov si, [bp + 6]                                           ;;
    mov cx, [bp + 4]                                           ;;
    mov ah, 0x10 ; only need to do this    once                ;;
                                                               ;;
nextchar12:                                                    ;;
    mov al, [si]                                               ;;
    mov [es:di], ax                                            ;;
    add di, 2                                                  ;;
    add si, 1                                                  ;;
    loop nextchar12                                            ;; 
                                                               ;;
                                                               ;;
    pop di                                                     ;;
    pop si                                                     ;;
    pop cx                                                     ;;
    pop ax                                                     ;;
    pop es                                                     ;; 
    pop bp                                                     ;; 
   ret 4;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



clrscr2:     ;.......backgound of second screen...............;;
    push es                                                   ;;
    push ax                                                   ;;
    push di                                                   ;;      
                                                              ;;
    mov  ax, 0xb800                                           ;;      
    mov  es, ax                                               ;;
    mov  di, 0                                                ;;      
                                                              ;;       
                                                              ;;                     
nextloc2:                                                     ;;
    mov  word [es:di], 0x1020                                 ;;      
    add  di, 2                                                ;;
    cmp  di, 4000                                             ;;
    jne  nextloc2                                             ;;
                                                              ;;
    pop  di                                                   ;;
    pop  ax                                                   ;;
    pop  es                                                   ;;
    ret    ;...................................................
   
;;;;;;;;;random number function;;;;;;;;;
; generate a rand no using the system time
; simply it will generate different words
RANDSTART:
    MOV AH, 00h  ; interrupts to get system time        
    INT 1AH      ; CX:DX now hold number of clock ticks since midnight      

    mov  ax, dx
    xor  dx, dx
    mov  cx, 3
    div  cx       ; here dx contains the remainder of the division - from 0 to 9

    add  dl, '0'  ; to ascii from '0' to '9'
    ret
;;;;;     main part    ;;;;;;;;
printstr2:;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        push bp                                                     ;;
        mov  bp, sp                                                 ;;
        push es                                                     ;;
        push ax                                                     ;;
        push cx                                                     ;;
        push si                                                     ;;
        push di                                                     ;;
                                                                    ;;
        mov ax,0                                                    ;;
        mov [bp+4],ax   ; anything but not 2                        ;;
                                                                    ;; 
    mov di,1830                                                     ;; 
    mov dx,7                                                        ;;
    add dx,48
    mov ax,0xb800                                                       ;; 
    mov es,ax                                                       ;;
    mov dh,0x07                                                     ;;
    mov word [es:di],dx                                             ;;     
                                                                    ;; 
                                                                    ;;
    mov ah,1   ; guess that it is for input from user                                                     ;;  
    int 21h  
                                                           ;; 
    kik:                                                          ;;
        mov dl,al                                                       ;;
        mov ax, 0xb800                                                  ;;
        mov es, ax                                                      ;;
        mov di,bx                                                       ;;
        mov si, [bp + 10]                                               ;;
        mov cx, [bp +8]                                                 ;;
                                                                    ;;   
                                                                    ;; 
                                                                    ;;
    mov ah, 0x20 ; only need to do this    once                     ;; 
    mov ah,0                                                        ;;
                                                                    ;; 
                                                                    ;;
                                                                    ;; 
nextchar2:                                                          ;; 
                                                                    ;; 
    add ah,8                                                        ;;
    mov al, [si]                                                    ;;
    cmp al,dl                                                       ;;
    jz o                                                            ;;
                                                                    ;;
                                                                    ;;
j:                                                                  ;;
                                                                    ;;
        add si, 1                                                   ;;   
        loop nextchar2                                              ;;   
        jmp k                                                       ;;
                                                                    ;;   
o:                                                                  ;; 
                                                                    ;; 
     mov al,ah                                                      ;;
     mov ah,0                                                       ;;
     add ax,1474                                                    ;;
     mov di,ax                                                      ;;
                                                                    ;;
                                                                    ;;
                                                                    ;;
                                                                    ;;
     mov ax,[bp+2]                                                  ;; 
    add ax,1                                                        ;;
    mov [bp+2],ax                                                   ;;
     mov ax,0xB800                                                  ;;
     mov es,ax                                                      ;; 
                                                                    ;;
     mov dh,0x07                                                    ;;  
     mov word [es:di],dx                                            ;;
     mov ax,di                                                      ;;
     sub ax,1474                                                    ;;
     mov ah,al                                                      ;; 
     add si, 1                                                      ;;
     loop nextchar2                                                 ;;
                                                                    ;;                                                          
k:                                                                  ;;
    mov cl,7                                                        ;;
      jmp con                                                       ;;
                                                                    ;;
abc:                                                                ;;
     mov ax,over                                                    ;;
     push ax                                                        ;;           
     push word [ov]                                                 ;;
     mov bx,2120                                                    ;;                                     
     call printstr                                                  ;;
     jmp z                                                          ;;  
                                                                    ;; 
abcd:                                                               ;;
     mov ax,done                                                    ;; 
     push ax                                                        ;;       
     push word [ddd]                                                ;;
     mov bx,2120                                                    ;;                       
     call printstr                                                  ;;   
     jmp z                                                          ;;                
con:                                                                ;; 
    mov bx,[bp+2]                                                   ;;
    mov cx,0                                                        ;;
    cmp cx,bx                                                       ;;
    je end
        jmp kok
    end:                                                            ;;
    mov cx,[bp+6]                                                   ;;
    sub cx,1                                                        ;;
    mov [bp+6],cx                                                   ;;
    mov ax,space                                                    ;;
     push ax                                                        ;;      
     push word [sp1]                                                ;; 
     mov bx,2830                                                    ;;
     mov dx,6                                                       ;; 
    cmp cx,dx                                                       ;;
     je fast                                                        ;; 
    mov ax,space                                                    ;; 
     push ax                                                        ;;
     push word [sp1]                                                ;; 
     mov bx,2666                                                    ;;
    mov dx,5                                                        ;;
     cmp cx,dx                                                      ;;
       je fast                                                      ;; 
    mov ax,space                                                    ;;
     push ax                                                        ;;    
     push word [sp1]                                                ;;
     mov bx,2808                                                    ;;
    mov dx,4                                                        ;; 
     cmp cx,dx                                                      ;;
      je fast                                                       ;;
    mov ax,space                                                    ;;
     push ax                                                        ;;
     push word [sp1]                                                ;; 
     mov bx,2654                                                    ;;
    mov dx,3                                                        ;;  
     cmp cx,dx                                                      ;;   
      je fast                                                       ;;
                                                                    ;;
    mov ax,space                                                    ;;   
     push ax                                                        ;; 
     push word [sp1]                                                ;;
     mov bx,2500                                                    ;;
    mov dx,2                                                        ;;
     cmp cx,dx                                                      ;;
     je fast                                                        ;;   
    mov ax,space                                                    ;;
     push ax                                                        ;;                   
     push word [sp1]                                                ;;
     mov bx,2340                                                    ;;
    mov dx,1                                                        ;;
     cmp cx,dx                                                      ;;
     je fast                                                        ;;
                                                                    ;;
       mov ax,space                                                 ;;
     push ax                                                        ;;    
     push word [sp1]                                                ;; 
     mov bx,2660                                                    ;;
    mov dx,0                                                        ;; 
     cmp cx,dx                                                      ;;
     je fast                                                        ;;
                                                                    ;; 
fast:                                                               ;;  
call printstr12                                                     ;;
    mov di,1830                                                     ;;
    mov ax,0xB800                                                   ;; 
    mov dx,[bp+6]                                                   ;;
    add dx,48                                                       ;;
    mov es,ax                                                       ;;
    mov dh,0x07                                                     ;;
    mov word [es:di],dx                                             ;;
                                                                    ;;
    mov bx,0                                                        ;;
                                                                    ;;
    cmp cx,bx                                                       ;;
    je abc                                                          ;;
    jmp continue                                                    ;;
                                                                    ;;    
 kok:                                                               ;;
    mov bx,0                                                        ;;
   mov cx,[bp+8]                                                    ;;
   kokk:                                                            ;;
                                                                    ;;   
    mov dx, 1482                                                    ;;
     add dx,bx                                                      ;;
    mov di,dx                                                       ;;
    mov dx,word [es:di]                                             ;;
                                                                    ;;
    mov ax,dx                                                       ;; 
    mov di, 1480                                                    ;;
    mov dx,word [es:di]                                             ;;  
   cmp dx,ax                                                        ;;
   je continue                                                      ;;
   add bx,8                                                         ;;
   loop kokk                                                        ;;
   jmp abcd                                                         ;;
    continue:                                                       ;;
    mov ax,0                                                        ;;
    mov [bp+2],ax                                                   ;;
     mov ax,character                                               ;;
    push ax                                                         ;;
    push word [char]                                                ;;
     mov bx,3000                                                    ;;                                  
    ;call printstr                                                  ;;
       mov ah,1      ;  input character and store it in al register ;; 
     int 21h                                                        ;;
     mov dl,al                                                      ;;
     jmp kik                                                          ;;   
                                                                    ;; 
 z:                                                                 ;;
    pop di                                                          ;;
    pop si                                                          ;;
    pop cx                                                          ;;
    pop ax                                                          ;;
    pop es                                                          ;;  
    pop bp    
    ret 8                                                          ;; 
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
     

start:
    call clrscr

    ;name of the game
    mov ax, message 
    push ax                                                       
    push word [length]                                                                                                      
    mov bx,706                 ; location                                                                                                   
    call printstr                  

    ;second line
    mov bx,0                    ; clearing the bx                                                           
    mov bx,960                                                    
    mov ax, line2                                                   
    push ax                                                       
    push word [length2]                                           
    call printstr  
    
    ; by
    mov bx, 1380               ; location                                        
    mov ax, names                                                   
    push ax                                                       
    push word [n1]                                           
    call printstr  
    
    ;making character

    ;               |
    ;               0
    ;              / \
    ;             /   \

    mov ax,dash2
    push ax                                                       
    push word [dd2]  
    mov bx,2340                                                                              
    call printstr12

    mov ax,f11 
    push ax                                                       
    push word [f12]  
    mov bx,2500                                                                                
    call printstr12

    mov ax,dash3
    push ax                                                       
    push word [dd3]  
    mov bx,2666                                                                                                  
    call printstr12 
    
    mov ax,dash4
    push ax                                                       
    push word [dd4]  
    mov bx,2654                                                                                                    
    call printstr12 
    
    mov ax,dash4
    push ax                                                       
    push word [dd4]  
    mov bx,2808                                                                                              
    call printstr12 
    
    mov ax,dash3
    push ax                                                       
    push word [dd3]  
    mov bx,2832                                                                                                
    call printstr12                                                
                                                                 
   ;wait for keypress                                            
    mov ah, 0x1        ; input char is 0x1 in ah                    
    int 0x21            


    call clrscr2
    ;'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    ; again creating the character for the next screen
    ; using printstr instead of printstr12 for the background of the character
    mov ax,f11 
    push ax                                                       
    push word [f12]  
    mov bx,2500                                                                                
    call printstr

    mov ax,dash2
    push ax                                                       
    push word [dd2]  
    mov bx,2660                                                                           
    call printstr
    
    mov ax,dash2
    push ax                                                       
    push word [dd2]  
    mov bx,2340                                                                              
    call printstr
    
    mov ax,dash3
    push ax                                                       
    push word [dd3]  
    mov bx,2666                                                                                                  
    call printstr 
    
    mov ax,dash4
    push ax                                                       
    push word [dd4]  
    mov bx,2654                                                                                                    
    call printstr 
    
    mov ax,dash4
    push ax                                                       
    push word [dd4]  
    mov bx,2808                                                                                              
    call printstr 
        
    mov ax,dash3
    push ax                                                       
    push word [dd3]  
    mov bx,2832                                                                                                
    call printstr 
    ; end of character code

    mov ax,found                                              
    push ax                                                      
    push word [f1]                                               
    mov bx,1800                                                                                                     
    call printstr 

    mov ax,h 
    push ax                                                       
    push word [l]  
    mov bx,200                                                                                                       
    call printstr 

RANDGEN: 
    call RANDSTART
    mov ah,48         ; 48 is a thing like check or to compare... guess so
    cmp ah,dl
    jz zeroo

    mov ah,49
    cmp ah,dl
    jz onee

    mov ah,50
    cmp ah,dl

    jnz end2
      jmp twoo

end2:
zeroo:
    mov ax,hint1 
    push ax                                                      
    push word [h1]  
    mov bx,210                                                                                             
    call printstr 
   
    mov ax,w1 
    push ax                                                       
    push word [w11]  
    mov bx,520                                                                                         
    call printstr 

    mov ax,comment 
    push ax                                                       
    push word [c]  
    mov bx,840                                                                                      
    call printstr

    mov ax,character 
    push ax                                                       
    push word [char]  
    mov bx,1160                                                                                      
    call printstr
    
    
    mov dl,[one1]
    mov cx,1480
; display single dash
d1:
    mov ax,dash 
    push ax                                                       
    push word [dash1]  
    mov bx,cx                                                                             
    call printstr
    add cx,8
    sub dl,1
    jnz d1
    
    ;code for alphabets
    mov cx,0
    push cx   
    mov ax,one 
    push ax                                                       
    push word [one1]  
    mov bx,3000  
    mov cx,7
    push cx      
    mov bx,0
    push bx     
                                                                    
    call printstr2 
    jmp cool   
                                           
onee:
     mov ax,hint2 
     push ax                                                       
     push word [h2]  
     mov bx,210                                                                                              
     call printstr 

     mov ax,w2 
     push ax                                                       
     push word [w12]  
     mov bx,520                                                                                          
     call printstr 
   
     mov ax,comment 
     push ax                                                       
     push word [c]  
     mov bx,840                                                                                    
     call printstr 
     mov ax,character 
     push ax                                                       
     push word [char]  
     mov bx,1160                                                                                      
     call printstr 
    
     mov dl,[two1]
     mov cx,1480
     
d2:
    mov ax,dash 
    push ax                                                       
    push word [dash1]  
    mov bx,cx                                                                                     
    call printstr

    add cx,8
    sub dl,1
    jnz d2
    
    mov cx,0
    push cx   
    mov ax,two
    push ax                                                       
    push word [two1]  
    mov bx,3000 
    mov cx,7
    push cx 
    mov bx,0
    push bx                                                                                      
    call printstr2 
    jmp cool
    
twoo:
    mov ax,hint3
    push ax                                                       
    push word [h3]                                                  
    mov bx,210                                                                                               
    call printstr

    mov ax,w3 
    push ax                                                        
    push word [w13]  
    mov bx,520                                                                                           
    call printstr  
    
    mov ax,comment 
    push ax                                                       
    push word [c]  
    mov bx,840                                                                                        
    call printstr 
    mov ax,character 
    push ax                                                       
    push word [char]  
    mov bx,1160                                                                                    
    call printstr 
    
    mov dl,[three1]
    mov cx,1480
     
d3:
    mov ax,dash 
    push ax                                                       
    push word [dash1]  
    mov bx,cx                                                                                     
    call printstr
    add cx,8
    sub dl,1
    jnz d3
    
    mov cx,0
    push cx   
    mov ax,three
    push ax                                                       
    push word [three1]  
    mov bx,3000   
    mov cx,7
    push cx    
    mov bx,0
    push bx                                                                 
    call printstr2 
    
cool:
 
  ; wait for keypress                                            
    mov ah, 0x1        ; input char is 0x1 in ah                    
    int 0x21 
    call clrscr
    mov ax,0x4c00
    int 0x21
