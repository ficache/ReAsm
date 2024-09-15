section .data
    msg: db "hello world", 0Ah
    helloLen: equ $-msg

section .text
    global _start

_start:
    mov edx, helloLen
    mov ecx, msg
    mov ebx, 1
    mov eax, 4
    int 80h