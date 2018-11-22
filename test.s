global _start

section .bss
C resb 11
aux_output resb 12

section .data
blank_msg db "", 0DH, 0AH
size_blank_msg equ $-blank_msg

section .text
_start: 


; Ler do teclado
sub esp, 4
push eax
mov eax, 3 ; C_INPUT C, 10
mov ebx, 0
mov ecx, C
mov edx, 11
int 80h
pop edx
add esp, 4
sub esp, 4
push eax
; Imprimir aux_output
mov eax, 4 ; C_OUTPUT C, 10
mov ebx, 1
mov ecx, C
mov edx, 10
int 80h
mov eax, 4
mov ebx, 1
mov ecx, blank_msg
mov edx, size_blank_msg
int 80h
pop edx
add esp, 4

; Ler do teclado
sub esp, 4
push eax
mov eax, 3 ; C_INPUT C, 10
mov ebx, 0
mov ecx, C
mov edx, 11
int 80h
pop edx
add esp, 4
sub esp, 4
push eax
; Imprimir aux_output
mov eax, 4 ; C_OUTPUT C, 10
mov ebx, 1
mov ecx, C
mov edx, 10
int 80h
mov eax, 4
mov ebx, 1
mov ecx, blank_msg
mov edx, size_blank_msg
int 80h
pop edx
add esp, 4

; Encerra o programa
mov eax, 1 ; STOP
mov ebx, 0
int 80h

; ----------------------- itoa inicio ---------------------------------
@itoa:
; input:
	; num -> eax
	; len -> ecx
; output:
	; string -> esi
mov edx, 0
mov edi, 0
cmp eax, 0
jg .itoa_begin
sub edx, eax
mov eax, edx
mov edx, 0
mov edi, 1
.itoa_begin:
add esi, ecx
dec esi
mov BYTE [esi], 0
mov ebx, 10
.itoa_convert:
xor edx, edx
div ebx
add DL, '0'
dec esi
mov [esi], DL
test EAX, EAX
jnz .itoa_convert
cmp edi, 0
je .itoa_reallyexit
xor edx, edx
add DL, '-'
dec esi
mov [esi], DL
.itoa_reallyexit:
ret
; ----------------------- itoa fim ---------------------------------

