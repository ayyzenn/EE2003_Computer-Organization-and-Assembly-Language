
SECTION .text:   

GLOBAL _start 

_start: 
	
	mov eax, 0x4 		
	mov ebx, 1 			
	mov ecx, roll 		
	mov edx, roll_leng 	
	int 0x80 			

	mov eax, 0x4 				
	mov ebx, 1 					
	mov ecx, name 		    	
	mov edx, name_leng   	    
	int 0x80 				

	mov eax, 0x1 				
	mov ebx, 0 					
	int 0x80

SECTION .data: 

	roll: db '20P-0051' ,  0xA,  0x0 
	roll_leng: equ $-roll

    name: db 'Saad Ahmad' ,  0xA,  0x0 
	name_leng: equ $-name
