bits 64

section .text

global ft_memset

;void *ft_memset(void *s, int c, size_t n);
ft_memset:
    mov rax, rcx
    mov r9, rcx
    xor rcx, rcx
    mov r15, rdx

for1:
    mov BYTE [r9], r15b
    inc rcx
    inc r9
    cmp rcx, r8
    jne for1

    ret