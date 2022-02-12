extern exit
extern scanf
extern printf
extern _chalchuite
global _start

section .text

_start:
	; request input
	push msg
	call printf
	add esp,4
	
	; Input
	push y
	push x
	push input
	call scanf
	add esp,12
	
	; moving x and y
	mov ebx,[y]
	mov ecx,[x]
	
	; call our import function
	push dword ebx
	push dword ecx
	call _chalchuite
	add esp,8
	
	; our answer will be in edx
	mov edx,eax
	
	; consider the result
	
		; isn't it summary?
		mov eax,[x]
		add eax,[y]
		cmp edx,eax
		je summary
		
		; isn't it difference?
		mov eax,[x]
		sub eax,[y]
		cmp eax,edx
		je difference
		
		; isn't it multiplication?
		mov ecx,edx
		mov eax,[x]
		mov bx,[y]
		mul bx
		cmp eax,ecx
		je multiplication
		
		; isn't it division?
		mov eax,[x]
		mov bx, [y]
		div bx
		cmp eax,ecx
		je division
		
		; isn't it remainder?
		
		mov eax,[x]
		mov bx, [y]
		div bx
		cmp eax,edx
		je remainder
		
		; isn't it bit and?
		
		mov eax,[x]
		mov ebx,[y]
		
	; compare results
	summary:
		push eax
		push msgSum
		call printf
		jmp _end
	difference:
		push eax
		push msgDif
		call printf
		jmp _end
	
	multiplication:
		push eax
		push msgMult
		call printf
		jmp _end
	
	division:
		push eax
		push msgDiv
		call printf
		jmp _end
	
	remainder:
		push msgRem
		call printf
		jmp _end
		
	land:
		push msgAnd
		call printf
		jmp _end
		
	lor:
		push msgOr
		call printf
		jmp _end
		
	lxor:
		push msgXor
		call printf
		jmp _end
	
	
	
	; end
	_end:
		add esp,4
		push dword 0
		call exit

section .data
	msg:	db "Enter two numbers: ", 0xa,0
	msg1:	db "%d", 0xA, 0
	msg2:	db "%d %d", 0xA,0
	input:	db "%d%d",0
	output:	db "%d",0xa,0
	msgSum: db "Operation is summary, result = %d",0xa,0
	msgDif:	db "Operation is Difference, result = %d",0xa,0
	msgMult:db "Operation is Multiplication, result = %d",0xa,0
	msgDiv:	db "Operation is Division, result = %d",0xa,0
	msgRem:	db "Operation is Remainder, result = %d",0xa,0
	msgAnd:	db "Operation is bit and, result = %d",0xa,0
	msgOr:	db "Operation is bit or, result = %d",0xa,0
	msgXor:	db "Operation is bit xor, result = %d",0xa,0
	

section .bss
	x resd 1
	y resd 1
	
	