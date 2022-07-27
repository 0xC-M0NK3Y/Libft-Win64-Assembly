bits 64

extern malloc

section .text

global ft_calloc

; void *ft_calloc(size_t nb_element, size_t size_element);

ft_calloc:
    mov rax, rcx
    mov r8, rdx
    imul rax, r8

    xor r15, r15
    mov r15, rax
    mov rcx, rax
    call malloc

    xor rcx, rcx

for1:
    mov BYTE [rax+rcx], BYTE 0
    inc rcx
    cmp rcx, r15
    jne for1

    ret