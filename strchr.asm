bits 64

section .text
    
global ft_strchr

; char *ft_strchr(const char *str, int c);

ft_strchr:
    mov r15, rcx
    mov r14, rdx

    xor r13, r13
    
while1:
    mov r13b, BYTE [r15]
    cmp r13, r14
    je end
    inc r15
    cmp r13b, 0
    jne while1
    xor rax, rax
    ret

end:
    mov rax, r15
    ret