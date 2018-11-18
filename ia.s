%define code 0
section .bss
struct resb 16
response resb 2
section	.data
msg1 db "Entre com codigo do curso ", 0DH, 0ah
size equ $-msg1

section .text
_start: mov eax, 4
mov ebx, 1
mov ecx, msg1
mov edx, size
int 80h

mov eax, 1
mov ebx, 0
int 80h