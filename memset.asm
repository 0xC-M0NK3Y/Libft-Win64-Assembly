bits 64

section .text

global ft_memset

; /!\ Don't work good /!\
;     Need a fix, it memset good but last caracteres are lost !

;void *ft_memset(void *s, int c, size_t n);
ft_memset:
    mov rax, rcx
    xor rcx, rcx
    mov r15, rdx

for1:
    mov [rax+rcx], r15
    inc rcx
    cmp rcx, r8
    jne for1

    ret