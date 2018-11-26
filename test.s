global _start

section .bss
INIT resb 4
POSITIVE resb 4
NEGATIVE resb 4
NEUTRAL resb 4
VECTOR resb 12
C resb 4
S resb 400
aux_input resb 12
aux_output resb 12

section .data
FIVE equ 5
TEN equ 10
blank_msg db "", 0DH, 0AH
size_blank_msg equ $-blank_msg
overflow_msg db "Erro, houve um overflow", 0DH, 0AH
size_overflow_msg equ $-overflow_msg

section .text
_start: 


; Ler do teclado
sub esp, 4
push eax
mov eax, 3 ; INPUT INIT
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
call @LeerInteiro
mov [INIT], eax

pop edx
add esp, 4
pop eax
add esp, 4
pop esi
add esp, 4
pop edx
add esp, 4
; Termina de converter

; Ler do teclado
sub esp, 4
push eax
mov eax, 3 ; INPUT POSITIVE
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
call @LeerInteiro
mov [POSITIVE], eax

pop edx
add esp, 4
pop eax
add esp, 4
pop esi
add esp, 4
pop edx
add esp, 4
; Termina de converter

; Ler do teclado
sub esp, 4
push eax
mov eax, 3 ; INPUT NEGATIVE
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
call @LeerInteiro
mov [NEGATIVE], eax

pop edx
add esp, 4
pop eax
add esp, 4
pop esi
add esp, 4
pop edx
add esp, 4
; Termina de converter

; Ler do teclado
sub esp, 4
push eax
mov eax, 3 ; INPUT NEUTRAL
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
call @LeerInteiro
mov [NEUTRAL], eax

pop edx
add esp, 4
pop eax
add esp, 4
pop esi
add esp, 4
pop edx
add esp, 4
; Termina de converter

; Ler do teclado
sub esp, 4
push eax
mov eax, 3 ; INPUT VECTOR
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
call @LeerInteiro
mov [VECTOR], eax

pop edx
add esp, 4
pop eax
add esp, 4
pop esi
add esp, 4
pop edx
add esp, 4
; Termina de converter

; Ler do teclado
sub esp, 4
push eax
mov eax, 3 ; INPUT VECTOR + 1
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
call @LeerInteiro
mov [VECTOR + 4], eax

pop edx
add esp, 4
pop eax
add esp, 4
pop esi
add esp, 4
pop edx
add esp, 4
; Termina de converter

; Ler do teclado
sub esp, 4
push eax
mov eax, 3 ; INPUT VECTOR + 2
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
call @LeerInteiro
mov [VECTOR + 8], eax

pop edx
add esp, 4
pop eax
add esp, 4
pop esi
add esp, 4
pop edx
add esp, 4
; Termina de converter

; Convert inteiro para string
sub esp, 4
push eax
sub esp, 4 ; OUTPUT NEUTRAL
push eax
sub esp, 4
push esi
sub esp, 4
push ecx
sub esp, 4
push edx
sub esp, 4
push ebx

mov eax, [NEUTRAL]
lea esi, [aux_output]
mov ecx, 12
call @EscreverInteiro

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

jmp INITIAL_LABEL ; jmp INITIAL_LABEL
MA_LABEL:

; Convert inteiro para string
sub esp, 4
push eax
sub esp, 4 ; OUTPUT NEGATIVE
push eax
sub esp, 4
push esi
sub esp, 4
push ecx
sub esp, 4
push edx
sub esp, 4
push ebx

mov eax, [NEGATIVE]
lea esi, [aux_output]
mov ecx, 12
call @EscreverInteiro

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

mov eax, [NEGATIVE] ; LOAD NEGATIVE

mov edx, eax ; MULT TEN
mov ebx, TEN
imul dword ebx
call @overflow_error

cdq ; DIV FIVE
mov ebx, FIVE
idiv dword ebx

mov [NEGATIVE], eax ; STORE NEGATIVE

; Convert inteiro para string
sub esp, 4
push eax
sub esp, 4 ; OUTPUT NEGATIVE
push eax
sub esp, 4
push esi
sub esp, 4
push ecx
sub esp, 4
push edx
sub esp, 4
push ebx

mov eax, [NEGATIVE]
lea esi, [aux_output]
mov ecx, 12
call @EscreverInteiro

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

xor edx, edx ; COPY NEGATIVE VECTOR + 1
mov edx, [NEGATIVE]
mov [VECTOR + 4], edx

jmp FINAL_LABEL ; jmp FINAL_LABEL
BOA_LABEL:

; Convert inteiro para string
sub esp, 4
push eax
sub esp, 4 ; OUTPUT POSITIVE
push eax
sub esp, 4
push esi
sub esp, 4
push ecx
sub esp, 4
push edx
sub esp, 4
push ebx

mov eax, [POSITIVE]
lea esi, [aux_output]
mov ecx, 12
call @EscreverInteiro

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

mov eax, [POSITIVE] ; LOAD POSITIVE

mov edx, eax ; MULT TEN
mov ebx, TEN
imul dword ebx
call @overflow_error

cdq ; DIV FIVE
mov ebx, FIVE
idiv dword ebx

mov [POSITIVE], eax ; STORE POSITIVE

; Convert inteiro para string
sub esp, 4
push eax
sub esp, 4 ; OUTPUT POSITIVE
push eax
sub esp, 4
push esi
sub esp, 4
push ecx
sub esp, 4
push edx
sub esp, 4
push ebx

mov eax, [POSITIVE]
lea esi, [aux_output]
mov ecx, 12
call @EscreverInteiro

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

xor edx, edx ; COPY POSITIVE VECTOR + 1
mov edx, [POSITIVE]
mov [VECTOR + 4], edx

jmp FINAL_LABEL ; jmp FINAL_LABEL
NEUTRAL_LABEL:

; Convert inteiro para string
sub esp, 4
push eax
sub esp, 4 ; OUTPUT NEUTRAL
push eax
sub esp, 4
push esi
sub esp, 4
push ecx
sub esp, 4
push edx
sub esp, 4
push ebx

mov eax, [NEUTRAL]
lea esi, [aux_output]
mov ecx, 12
call @EscreverInteiro

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

mov eax, [NEUTRAL] ; LOAD NEUTRAL

mov edx, eax ; MULT TEN
mov ebx, TEN
imul dword ebx
call @overflow_error

cdq ; DIV FIVE
mov ebx, FIVE
idiv dword ebx

mov [NEUTRAL], eax ; STORE NEUTRAL

; Convert inteiro para string
sub esp, 4
push eax
sub esp, 4 ; OUTPUT NEUTRAL
push eax
sub esp, 4
push esi
sub esp, 4
push ecx
sub esp, 4
push edx
sub esp, 4
push ebx

mov eax, [NEUTRAL]
lea esi, [aux_output]
mov ecx, 12
call @EscreverInteiro

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

xor edx, edx ; COPY NEUTRAL VECTOR + 1
mov edx, [NEUTRAL]
mov [VECTOR + 4], edx

jmp FINAL_LABEL ; jmp FINAL_LABEL
INITIAL_LABEL:

; Convert inteiro para string
sub esp, 4
push eax
sub esp, 4 ; OUTPUT INIT
push eax
sub esp, 4
push esi
sub esp, 4
push ecx
sub esp, 4
push edx
sub esp, 4
push ebx

mov eax, [INIT]
lea esi, [aux_output]
mov ecx, 12
call @EscreverInteiro

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

mov eax, [INIT] ; LOAD INIT

cmp eax, 0 ; JMPP BOA_LABEL
jg BOA_LABEL

cmp eax, 0 ; JMPN MA_LABEL
jl MA_LABEL

cmp eax, 0 ; JMPZ NEUTRAL_LABEL
jz NEUTRAL_LABEL
FINAL_LABEL:

; Convert inteiro para string
sub esp, 4
push eax
sub esp, 4 ; OUTPUT VECTOR
push eax
sub esp, 4
push esi
sub esp, 4
push ecx
sub esp, 4
push edx
sub esp, 4
push ebx

mov eax, [VECTOR]
lea esi, [aux_output]
mov ecx, 12
call @EscreverInteiro

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

; Convert inteiro para string
sub esp, 4
push eax
sub esp, 4 ; OUTPUT VECTOR + 1
push eax
sub esp, 4
push esi
sub esp, 4
push ecx
sub esp, 4
push edx
sub esp, 4
push ebx

mov eax, [VECTOR + 4]
lea esi, [aux_output]
mov ecx, 12
call @EscreverInteiro

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

; Convert inteiro para string
sub esp, 4
push eax
sub esp, 4 ; OUTPUT VECTOR + 2
push eax
sub esp, 4
push esi
sub esp, 4
push ecx
sub esp, 4
push edx
sub esp, 4
push ebx

mov eax, [VECTOR + 8]
lea esi, [aux_output]
mov ecx, 12
call @EscreverInteiro

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

; ----------------------- LeerInteiro inicio ---------------------------------
; input:
	; string -> esi
; output:
	; num -> eax
@LeerInteiro:
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
; ----------------------- LeerInteiro fim ---------------------------------

; ----------------------- EscreverInteiro inicio ---------------------------------
@EscreverInteiro:
; input:
	; num -> eax
	; len -> ecx
; output:
	; string -> esi
mov edx, 0
mov edi, 0
cmp eax, 0
jge .itoa_begin
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
; ----------------------- EscreverInteiro fim ---------------------------------

; ----------------------- EscreverChar inicio ---------------------------------
@EscreverChar:
mov eax, 4
mov ebx, 1
mov edx, 1
int 80h
mov eax, 4
mov ebx, 1
mov ecx, blank_msg
mov edx, size_blank_msg
int 80h
ret
; ----------------------- EscreverChar fim ---------------------------------

; ----------------------- LeerChar inicio ---------------------------------
@LeerChar:
mov eax, 3
mov ebx, 0
mov edx, 2
int 80h
ret
; ----------------------- LeerChar fim ---------------------------------

; ----------------------- EscreverString inicio ---------------------------------
@EscreverString:
mov eax, 4
mov ebx, 1
int 80h
ret
; ----------------------- EscreverString fim ---------------------------------

; ----------------------- LeerString inicio ---------------------------------
@LeerString:
mov eax, 3
mov ebx, 0
int 80h
ret
; ----------------------- LeerString fim ---------------------------------

; ----------------------- overflow inicio ---------------------------------
@overflow_error:
cmp edx, 0
je ret_overflow
cmp edx, -1
je ret_overflow
mov eax, 4
mov ebx, 1
mov ecx, overflow_msg
mov edx, size_overflow_msg
int 80h
; Encerra o programa
mov eax, 1
mov ebx, 0
int 80h
ret_overflow:
ret
; ----------------------- overflow fim ---------------------------------
