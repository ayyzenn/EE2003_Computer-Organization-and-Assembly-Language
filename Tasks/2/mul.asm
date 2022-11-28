[org 0x0100]

mov ax , 10
mov dx , 2
mul dx

mov [result] , ax

mov ax ,0x4c00
int 0x21


result: dw 0
