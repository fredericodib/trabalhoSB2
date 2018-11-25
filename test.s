global _start

section .bss
NUM resb 4
aux_input resb 12
aux_output resb 12

section .data
ONE equ 5
blank_msg db "", 0DH, 0AH
size_blank_msg equ $-blank_msg

section .text
_start: 


; Ler do teclado
sub esp, 4
push eax
mov eax, 3 ; INPUT NUM
mov ebx, 0
mov ecx, aux_input
mov edx, 12
int 80h

; Converte string para inteiro
sub esp, 4
push esi
sub esp, 4
push eax
sub esp, 4
push edx

mov esi, aux_input
call @atoi
mov [NUM], eax

pop edx
add esp, 4
pop eax
add esp, 4
pop esi
add esp, 4
pop edx
add esp, 4
; Termina de converter

mov eax, [NUM] ; LOAD NUM

cdq ; DIV ONE
mov ebx, ONE
idiv dword ebx

mov [NUM], eax ; STORE NUM

; Convert inteiro para string
sub esp, 4
push eax
sub esp, 4 ; OUTPUT NUM
push eax
sub esp, 4
push esi
sub esp, 4
push ecx
sub esp, 4
push edx
sub esp, 4
push ebx

mov eax, [NUM]
lea esi, [aux_output]
mov ecx, 12
call @itoa

pop ebx
add esp, 4
pop edx
add esp, 4
pop ecx
add esp, 4
pop esi
add esp, 4
pop eax
add esp, 4
; Termina de converter
; Imprimir aux_output
mov eax, 4
mov ebx, 1
mov ecx, aux_output
mov edx, 12
int 80h
mov eax, 4
mov ebx, 1
mov ecx, blank_msg
mov edx, size_blank_msg
int 80h
mov BYTE [aux_output], 0
mov BYTE [aux_output+1], 0
mov BYTE [aux_output+2], 0
mov BYTE [aux_output+3], 0
mov BYTE [aux_output+4], 0
mov BYTE [aux_output+5], 0
mov BYTE [aux_output+6], 0
mov BYTE [aux_output+7], 0
mov BYTE [aux_output+8], 0
mov BYTE [aux_output+9], 0
mov BYTE [aux_output+10], 0
mov BYTE [aux_output+11], 0
pop edx
add esp, 4

; Encerra o programa
mov eax, 1 ; STOP
mov ebx, 0
int 80h

; ----------------------- atoi inicio ---------------------------------
; input:
	; string -> esi
; output:
	; num -> eax
@atoi:
mov eax, 0
mov edx, 0
mov ecx, 0
movzx edx, BYTE[esi]
cmp edx, '-'
jne .atoi_convert
inc esi
mov ecx, 1
.atoi_convert:
movzx edx, BYTE[esi]
inc esi
cmp edx, '0'
jl .atoi_exit
cmp edx, '9'
jg .atoi_exit
sub edx, '0' ; converte para inteiro
imul eax, 10 ; eax = eax * 10
add eax, edx ; eax = eax + edx
jmp .atoi_convert
.atoi_exit:
cmp ecx, 0
je .atoi_reallyexit
mov edx, 0
sub edx, eax
mov eax, edx
.atoi_reallyexit:
ret
; ----------------------- atoi fim ---------------------------------

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

