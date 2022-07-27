bits 64

extern malloc

section .text

global ft_strjoin

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

;char *ft_strjoin(char *s1, char *s2);
;rcx = s1
;rdx = s2
ft_strjoin:
    mov r15, rdx
    mov rbx, rcx

    call ft_strlen              ; on appel strlen sur rcx, s1
    mov r12, rax                ; on stock resultat dans r12

    mov rcx, r15                ; on met r15, s2 dans rcx
    call ft_strlen              ; on appel strlen sur rcx, s2
    mov r13, rax                ; on stock resultat dans r13

    xor r14, r14                ; on met r14 a 0
    mov r14, r12                ; on met r12 dans r14
    add r14, r13                ; on fait r14 + r13 dans r10
    add r14, 1                  ; on ajoute 1 pour le \0

    mov rcx, r14                ; on met r14 dans rcx
    call malloc                 ; on appel malloc

    ; on a rax avec le pointeur mallocé a return
    ; on a s1 dans rbx, et s2 dans r15

    xor rcx, rcx                ; on met rcx a 0
for2:
    mov r8b, BYTE [rbx]         ; on met caractere de s1 dans r8b car un char 1 octects
    mov BYTE [rax+rcx], r8b     ; on met caractere r11b dans rax
    inc rbx
    inc rcx
    cmp rcx, r12                ; on compare le compteur rcx avec r8 la taille de s1
    jne for2                    ; on revien a for2 si pas egale

for3:                           ; on copie ensuite la deuxieme chaine jusqu'a la taille total
    mov r8b, BYTE [r15]
    mov BYTE [rax+rcx], r8b
    inc r15
    inc rcx
    cmp rcx, r14
    jne for3

    mov BYTE [rax+rcx], 0   ; on ajoute le \0

    ret