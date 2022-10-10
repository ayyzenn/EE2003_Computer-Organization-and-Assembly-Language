
SECTION .text:     			; code section 

GLOBAL _start 

sum:
	push ebp
	mov ebp , esp

	push eax
	push ebx

	mov eax , [ebp + 6]
	mov ebx , [ebp + 4]

	add eax , ebx
	mov ecx , eax

	pop ebx
	pop eax
	pop ebp

	ret 4

_start: 
	mov eax , [num1]
	mov ebx , [num2]
	push eax
	push ebx
	call sum
	mov eax, 0x4 				
	mov ebx, 1
	int 0x80 					


	; exit the program 
	mov eax, 0x1 
	mov ebx, 0 	
	int 0x80 	


; data section here. We can also move it above .code 
SECTION .data: 

	num1: dd 5 
	num2: dd 10




 
