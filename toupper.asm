bits 64

section .text

global ft_toupper

;int toupper(int c);

ft_toupper:
    mov r15, rcx

    cmp r15b, 97
    jb stop

    cmp r15b, 122
    ja stop

    sub r15, 32
    mov rax, r15
    ret

stop:
    mov rax, r15
    ret