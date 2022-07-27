bits 64

section .text

global ft_bzero

; void ft_bzero(void *s, size_t n);

ft_bzero:
    mov r15, rcx
    xor rcx, rcx

    cmp rdx, 0
    je end

for1:
    mov BYTE [r15+rcx], 0
    inc rcx
    cmp rcx, rdx
    jne for1

end:
    xor rax, rax
    ret