bits 64

extern malloc

section .text

global ft_substr

; char *ft_substr(char *s, unsigned int start, size_t len);
ft_substr:
    mov r15, r8
    mov r14, rdx
    mov r13, rcx

    call ft_strlen
    mov r12, rax

    mov r8, r12
    sub r12, r14

    cmp r15, r12
    jl case1

    mov rcx, r12
    add rcx, 1
    call malloc
continue:
    xor rcx, rcx

for2:
    mov r9b, BYTE [r13+r14]
    cmp r9b, 0
    je end
    mov BYTE [rax+rcx], r9b
    inc rcx
    inc r14
    cmp rcx, r15
    jne for2
end:
    mov BYTE [rax+rcx], 0
    ret

case1:
    mov rcx, r15
    add rcx, 1
    call malloc
    jmp continue


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