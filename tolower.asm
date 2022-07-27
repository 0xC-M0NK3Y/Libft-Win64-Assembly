bits 64

section .text

global ft_tolower

;int tolower(int c);

ft_tolower:
    mov r15, rcx

    cmp r15b, 65
    jb stop

    cmp r15b, 90
    ja stop

    add r15, 32
    mov rax, r15
    ret

stop:
    mov rax, r15
    ret