bits 64

extern malloc

section .text

global ft_strdup

;char *ft_strdup(char *str);
ft_strdup:
    mov r15, rcx                 ; on stock la chaine dans r8
    call ft_strlen               ; on call strlen avec rcx = str
    mov r12, rax                 ; on stock la taille dans r9
    add rax, 1                   ; on rajoute 1 pour le \0
    mov rcx, rax
    call malloc                  ; on appel malloc
    xor rcx, rcx                 ; on met rcx a 0

for2:
    mov r14b, BYTE [r15+rcx]     ; on prend le premier caractere dans r15
    mov BYTE [rax+rcx], r14b     ; on le met copie dans rax
    inc rcx                      ; on icremente le compteur
    cmp rcx, r12                 ; on le compare a la taille
    jne for2

    mov BYTE [rax+rcx], 0        ; \0
    ret


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