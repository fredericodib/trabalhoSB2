global _start

section .bss
result resb 4
num resb 4
i resb 4
num_input resb 10
result_output resb 10

section	.data
msg db "Entre com um numero:", 0DH, 0AH
size_msg equ $-msg
overflow_msg db "Erro, houve um overflow", 0DH, 0AH
size_overflow_msg equ $-overflow_msg
blank_msg db "", 0DH, 0AH
size_blank_msg equ $-blank_msg
one equ 1

section .text
_start: 

; Imprimir a string
mov eax, 4
mov ebx, 1
mov ecx, msg
mov edx, size_msg
int 80h

; Ler do teclado
mov eax, 3
mov ebx, 0
mov ecx, num_input
mov edx, 10
int 80h

; Converte string para inteiro
sub esp, 4
push esi
sub esp, 4
push eax
sub esp, 4
push edx

mov esi, num_input
call @atoi
mov [num], eax

pop edx
add esp, 4
pop eax
add esp, 4
pop esi
add esp, 4
; Termina de converter

;fatorial

mov edx, one ; Copy um, result
mov [result], edx 

mov edx, one ; Copy um, i
mov [i], edx 

loop:

mov eax, [i] ; load i

sub eax, [num] ; sub num

cmp eax, 0 ; jmpp fim
jg fim

mov eax, [result] ; load result

mov edx, eax ; mult i
imul dword [i]
cmp edx, 0
jne @overflow_error

mov [result], eax ; store result

mov eax, [i] ; load i

add eax, one ; add one

mov [i], eax ; store i

jmp loop ; jmp loop

fim:



;fim fatorial


; Convert inteiro para string
sub esp, 4
push eax
sub esp, 4
push esi
sub esp, 4
push ecx
sub esp, 4
push edx
sub esp, 4
push ebx

mov eax, [result]
lea esi, [result_output]
mov ecx, 10
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

; Imprimir result_output
mov eax, 4
mov ebx, 1
mov ecx, result_output
mov edx, 10
int 80h

mov eax, 4
mov ebx, 1
mov ecx, blank_msg
mov edx, size_blank_msg
int 80h


; Encerra o programa
mov eax, 1
mov ebx, 0
int 80h



; ----------------------- atoi inicio ---------------------------------
@atoi:

; input:
	; string -> esi
; output:
	; num -> eax

mov eax, 0
mov edx, 0

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

ret

; ----------------------- atoi fim ---------------------------------


; ----------------------- itoa inicio ---------------------------------
 @itoa:
; input:
	; num -> eax
	; len -> ecx
; output:
	; string -> esi

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

ret

; ----------------------- itoa fim ---------------------------------

; ----------------------- overflow inicio ---------------------------------
@overflow_error:

mov eax, 4
mov ebx, 1
mov ecx, overflow_msg
mov edx, size_overflow_msg
int 80h

; Encerra o programa
mov eax, 1
mov ebx, 0
int 80h

; ----------------------- overflow fim ---------------------------------