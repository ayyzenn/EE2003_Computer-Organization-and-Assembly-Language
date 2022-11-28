[org 0x0100]

mov ax , 10
div ax

mov [div_result] , ax

mov ax ,0x4c00
int 0x21

div_result: dw 0



