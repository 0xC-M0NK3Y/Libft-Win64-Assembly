bits 64

extern malloc

section .text
global ft_itoa

;char *ft_itoa(int nb);
ft_itoa:
    mov r15, rcx                ; on stock nb dans 15

    mov rcx, 12                 ; on malloc 12 taille maximum
    call malloc             

    mov r9, rax

    xor rcx, rcx  
    xor r10, r10              

    cmp r15, 0                  ; on regarde si c'est negatif ou positif
    jl nega                     ; r15 < 0

for1:
    xor rdx, rdx                ; on met rdx a 0 (va stocker le modulo)
    mov rax, r15                ; on met le chiffre a diviser dans rax
    mov rcx, 10                 ; on met dans rcx le diviseur
    div rcx                     ; on appel div (modulo dans rdx et resultat dans rax)
    add rdx, 48                 ; on rajoute 48 pour avoir le code ascii correspondant
    mov [r9+r10], rdx           ; on met le caractere dans la chaine
    inc r10                     ; on incremente le compteur de la chaine
    mov r15, rax                ; on met le resultat de la division par 10 dans r15
    cmp r15, 0                  ; on compare r15 avec 0
    jne for1                    ; on jump a for1 si c'est pas le cas

    mov rbx, r10
    jmp revstr
end:
    mov BYTE [r9+rbx], 0        ; on rajoute le \0
    mov rax, r9                 ; on return la chaine de caractere
    ret

; cas ou c'est negatif on rajoute le '-' et on incremente le compteur r10 et on met r15 positif
nega:
    mov BYTE [r9], '-'
    neg r15
    inc r10
    jmp for1


inega:
    inc r11
    jmp for2


revstr:
    xor rdx, rdx                ;on divise r10 par 2
    mov rax, r10
    mov rcx, 2
    div rcx

    xor r11, r11                ; on utilise r11 comme compteur
    mov r12, rax                ; on stock r10 / 2 dans r12
    cmp BYTE [r9], '-'          ; on passe le - si besoin
    je inega

for2:
    mov r13b, BYTE [r9+r11]     ; on met le premiere caractere dans 13
    mov r14b, BYTE [r9+r10-1]   ; on met le dernier dans r14
    mov BYTE [r9+r11], r14b
    mov BYTE [r9+r10-1], r13b    ; on les echange
    add r11, 1
    sub r10, 1
    cmp r11, r12                ; on sarrete a la motitier (r12 = r10 / 2)
    jl for2
    jmp end