bits 64

section .text

global ft_isdigit

; int ft_isdigit(int c);

ft_isdigit:
    mov r15, rcx

    cmp r15b, 48
    jb stop

    cmp r15b, 57
    ja stop

    mov rax, 1
    ret

stop:
    xor rax, rax
    ret