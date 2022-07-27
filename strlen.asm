bits 64

section .text

global ft_strlen

;int ft_strlen(char *str)
ft_strlen:
    xor rax, rax

for1:
    mov r8b, BYTE [rcx]
    inc rax
    inc rcx
    test r8b, r8b
    jne for1

    sub rax, 1
    ret