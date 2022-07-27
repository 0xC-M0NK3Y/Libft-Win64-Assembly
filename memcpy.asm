bits 64

section .text

global ft_memcpy

;void *ft_memcpy(void *dest, const void *src, size_t size);
ft_memcpy:
    mov r9, rcx
    mov rax, rcx
    xor rcx, rcx

    test r8, r8
    je stop

for1:
    mov r15b, BYTE [rdx]
    mov BYTE [r9], r15b
    inc r9
    inc rdx
    add rcx, 1
    cmp rcx, r8
    jne for1

stop:
    ret
