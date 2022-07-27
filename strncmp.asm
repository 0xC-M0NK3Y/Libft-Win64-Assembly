bits 64

extern printf

section .data
    frm db "%d", 0

section .text

global ft_strncmp

;int ft_strncmp(const char *s1, const char *s2, size_t lenght);
ft_strncmp:
    mov r15, rcx                ; on met s1 dans r15
    mov r14, rdx                ; on met s2 dans r14

    xor rcx, rcx                ; on met le compteur a 0

for1:
    mov r13b, BYTE [r15+rcx]    ; on met chaque octets de s1 dans r13b
    mov r12b, BYTE [r14+rcx]    ; on met chaque octets de s2 dans r12b
    add rcx, 1                  ; on incremente le compteur
    cmp r13b, r12b              ; on compare les deux octets
    jne end                     ; si ya une difference on quitte
    cmp r13b, 0                 ; on compare au \0
    je end
    cmp r12b, 0                 ; on compare au \0
    je end
    cmp rcx, r8                 ; on compare le compteur a la lenght
    jne for1

end:
    xor r8, r8                  ; on met a 0 r8
    xor r9, r9                  ; on met a 0 r9
    mov r8b, r13b
    mov r9b, r12b
    sub r8, r9                  ; on fait la difference
    mov rax, r8
    ret